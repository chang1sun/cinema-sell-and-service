<%--
  Created by IntelliJ IDEA.
  User: mechrevo
  Date: 2020/11/24
  Time: 19:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="cinema.bean.MovieHall" %>
<%@ page import="cinema.bean.Movie" %>
<%@ page
        import="cinema.bean.Timetable" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="cinema.dao.SeatDao" %><%-- Created by IntelliJ IDEA. User: mechrevo Date: 2020/11/21 Time: 14:07 To change this template use File | Settings | File Templates. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% MovieHall movieHall = (MovieHall) session.getAttribute("movieHall");%>
<% Timetable timetable = (Timetable) session.getAttribute("timetable");%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=chrome">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Choose your seat</title>
    <link href="bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="listCinema_css.css" rel="stylesheet">
<%--    <link rel="stylesheet" type="text/css" href="seatSelect_css.css"/>--%>
    <style type="text/css"> .front {
        width: 300px;
        margin: 5px 32px 45px 32px;
        background-color: #f0f0f0;
        color: #666;
        text-align: center;
        padding: 3px;
        border-radius: 5px;
    }

    .booking_area {
        float: right;
        position: relative;
        width: 200px;
        height: 450px;
        /*z-index: 9999;*/
    }

    .booking_area h3 {
        margin: 5px 5px 0 0;
        font-size: 16px;
    }

    .booking_area p {
        line-height: 26px;
        font-size: 16px;
        color: #969895;
    }

    .booking_area p span {
        color: #6eaeb8

    }
    .booking_area input {
        background: #6db88e;
        color: #0f0f0f;
    }
    .booking_area a{
        background: #6db88e;
        color: #0f0f0f;
    }

    .booking_area.help-block {
        color: #a4b847;
    }

    div.seatCharts-cell {
        color: #b86889;
        height: 25px;
        width: 25px;
        line-height: 25px;
        margin: 3px;
        float: left;
        text-align: center;
        outline: none;
        font-size: 13px;
    }

    div.seatCharts-seat {
        color: #0f0f0f;
        cursor: pointer;
        -webkit-border-radius: 5px;
        -moz-border-radius: 5px;
        border-radius: 5px;
    }

    div.seatCharts-row {
        height: 35px;
    }

    div.seatCharts-seat.available {
        background-color: #B9DEA0;
    }

    div.seatCharts-seat.focused {
        background-color: #76B474;
        border: none;
    }

    div.seatCharts-seat.selected {
        background-color: #E6CAC4;
    }

    div.seatCharts-seat.unavailable {
        background-color: #b85c2e;
        cursor: not-allowed;
    }

    div.seatCharts-container {
        border-right: 1px dotted #adadad;
        width: 400px;
        padding: 20px;
        float: left;
    }

    div.seatCharts-legend {
        padding-left: 0px;
        position: absolute;
        bottom: 16px;
    }

    ul.seatCharts-legendList {
        padding-left: 0px;
    }

    .seatCharts-legendItem {
        float: left;
        width: 90px;
        margin-top: 10px;
        line-height: 2;
    }

    span.seatCharts-legendDescription {
        margin-left: 5px;
        line-height: 30px;
    }

    .checkout-button {
        display: block;
        width: 80px;
        height: 24px;
        line-height: 20px;
        margin: 10px auto;
        border: 1px solid #999;
        font-size: 14px;
        cursor: pointer
    }

    #seats_chose {
        max-height: 150px;
        overflow-y: auto;
        overflow-x: none;
        width: 200px;
    }

    #seats_chose li {
        float: left;
        width: 72px;
        height: 26px;
        line-height: 26px;
        border: 1px solid #d3d3d3;
        background: #aab833;
        color: #0f0f0f;
        margin: 6px;
        font-size: 14px;
        font-weight: bold;
        text-align: center
    }</style>
</head>
<body>
<div class="site-wrapper">
    <div class="site-wrapper-inner">
        <div class="cover-container">
            <div class="masthead clearfix">
                <div class="inner"><h3
                        class="masthead-brand"><% out.println("Hello, " + session.getAttribute("username"));%></h3>
                    <nav>
                        <ul class="nav masthead-nav">
                            <li class="active"><a href="#">主页</a></li>
                            <li><a href="profile.jsp">我的</a></li>
<%--                            <li><a href="#">Contact</a></li>--%>
                        </ul>
                    </nav>
                </div>
            </div>
            <div class="demo clearfix">
                <div id="seat_area">
                    <div class="front">屏幕</div>
                </div><!---右边选座信息----->
                <div class="booking_area"><p>电影：<span><%=timetable.getMName()%></span></p>
                    <p>时间：<span><%=String.format("%s—%s", new SimpleDateFormat("HH:mm").format(timetable.getShowTime()), new SimpleDateFormat("HH:mm").format(timetable.getEndTime()))%></span></p>
                    <p>座位：</p>
                    <ul id="seats_chose"></ul>
                    <p>票数：<span id="tickects_num">0</span></p>
                    <p>总价：<b>￥<span id="total_price">0</span></b></p>
                    <div style="display: inline-block;"><input type="button" class="btn" value="生成订单"></div>
                    <div style="display: inline-block;"><a href="<%=request.getContextPath()%>/addTicket" class="btn">提交订单</a></div>
                    <div id="message"><span style="color: #a4b847"></span></div>
                    <div id="legend"></div>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript"  src="https://s3.pstatp.com/cdn/expire-1-M/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="jquery/jquery.seat-charts.min.js"></script>
<script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $('.booking_area input').click(function () {
            var seatSelected = [];
            var elements = document.querySelectorAll('#seats_chose li');
            Array.prototype.forEach.call(elements, function (element){
                var data = {}
                data["row"] = element.id[0];
                data["col"] = element.id[2];
                seatSelected.push(data);
            });
            htmlobj = $.ajax({
                type: "post",
                url: "<%=request.getContextPath()%>/generateTicket",
                data: {
                    Seats: JSON.stringify(seatSelected)
                },
                dataType: 'text',
                success: function () {
                    alert("订单生成成功，点击\"提交订单\"以继续");
                }
                })
            })
        });
</script>
<script type="text/javascript"> var price = <%=timetable.getPrice()%>; /*电影票价*/
$(document).ready(function () {
    var $cart = $('#seats_chose'), /*座位区*/ $tickects_num = $('#tickects_num'), /*票数*/ $total_price = $('#total_price'); /*票价总额*/
    var sc = $('#seat_area').seatCharts({
        map: [/*座位结构图 a 代表座位; 下划线 "_" 代表过道*/ 'cccccccccc', '__________', 'cc_cccc_cc', 'cc_cccc_cc', 'cc_cccc_cc', 'cc_cccc_cc', 'cc_cccc_cc', 'cc_cccc_cc', 'cc_cccc_cc', 'cc_cccc_cc'],
        naming: {/*设置行列等信息*/ top: false, /*不显示顶部横坐标（行） */ getLabel: function (character, row, column) { /*返回座位信息 */
                return column;
            }
        },
        legend: {/*定义图例*/ node: $('#legend'), items: [['c', 'available', '可选座'], ['c', 'unavailable', '已售出']]},
        click: function () {
            if (this.status() == 'available') { /*若为可选座状态，添加座位*/
                $('<li>' + (this.settings.row + 1) + '排' + this.settings.label + '座</li>').attr('id', this.settings.id).data('seatId', this.settings.id).appendTo($cart);
                $tickects_num.text(sc.find('selected').length + 1); /*统计选票数量*/
                $total_price.text(getTotalPrice(sc) + price);/*计算票价总金额*/
                return 'selected';
            } else if (this.status() == 'selected') { /*若为选中状态*/
                $tickects_num.text(sc.find('selected').length - 1);/*更新票数量*/
                $total_price.text(getTotalPrice(sc) - price);/*更新票价总金额*/
                $('#cart-item-' + this.settings.id).remove();/*删除已预订座位*/
                return 'available';
            } else if (this.status() == 'unavailable') { /*若为已售出状态*/
                return 'unavailable';
            } else {
                return this.style();
            }
        }
    });/*设置已售出的座位*/
    // sc.get(['1_3', '1_4', '4_4', '4_5', '4_6', '4_7', '4_8']).status('unavailable');
    var reservedSeats = new Array();
    <% String[] reserved = new SeatDao().getReserved(timetable);%>
    <% for(int i=0; i <reserved.length; i++){ %>
        reservedSeats[<%=i%>] = "<%=reserved[i]%>";
    <% } %>
    sc.get(reservedSeats).status('unavailable');
    // if (reservedSeats != null){sc.get(reservedSeats).status('unavailable');}

});</script>

<script>
function getTotalPrice(sc) { /*计算票价总额*/
    var total = 0;
    sc.find('selected').each(function () {
        total += price;
    });
    return total;
}</script>

</body>
</html>


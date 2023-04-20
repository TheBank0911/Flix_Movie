<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
 <style>
    /* button like share */
    .wrapper {
      display: inline-flex;
      list-style: none;
      height: 120px;
      width: 100%;
      padding-top: 20px;
      font-family: "Poppins", sans-serif;
      justify-content: center;
    }

    .wrapper .icon {
      position: relative;
      background: #fff;
      border-radius: 50%;
      margin: 10px;
      width: 50px;
      height: 50px;
      font-size: 18px;
      display: flex;
      justify-content: center;
      align-items: center;
      flex-direction: column;
      box-shadow: 0 10px 10px rgba(0, 0, 0, 0.1);
      cursor: pointer;
      transition: all 0.2s cubic-bezier(0.68, -0.55, 0.265, 1.55);
    }

    .wrapper .tooltip {
      position: absolute;
      top: 0;
      font-size: 14px;
      background: #fff;
      color: #fff;
      padding: 5px 8px;
      border-radius: 5px;
      box-shadow: 0 10px 10px rgba(0, 0, 0, 0.1);
      opacity: 0;
      pointer-events: none;
      transition: all 0.3s cubic-bezier(0.68, -0.55, 0.265, 1.55);
    }

    .wrapper .tooltip::before {
      position: absolute;
      content: "";
      height: 8px;
      width: 8px;
      bottom: -3px;
      left: 50%;
      transform: translate(-50%) rotate(45deg);
      transition: all 0.3s cubic-bezier(0.68, -0.55, 0.265, 1.55);
    }

    .wrapper .icon:hover .tooltip {
      top: -45px;
      opacity: 1;
      visibility: visible;
      pointer-events: auto;
    }

    .wrapper .icon:hover span,
    .wrapper .icon:hover .tooltip {
      text-shadow: 0px -1px 0px rgba(0, 0, 0, 0.1);
    }

   button:hover {
	border: none;
}

    }
  </style>

  <div class="row" style="margin-left: 0; margin-right: 0; margin-top: 20px">
    <div class="col-lg-8 mb-8" style="margin-top: 20px">
      <div class="card">
        <iframe width="100%" height="500" src="${Videoid.href}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
        <div class="card-body">
          <h5 class="card-title">${Videoid.title}</h5>
          <p class="card-text">
            ${Videoid.descriptions}
          </p>
          <ul class="wrapper">
         <form method="post"><li class="icon facebook">
            <span><button formaction="./like?idvideo=${Videoid.id}" style="border: none;background-color: white;cursor: pointer;"><i class="fa fa-thumbs-up"></button></i></span>
            </li></form>
            
         
            <li class="icon twitter">
                        <span><i data-toggle="modal" data-target="#myModal" class="fa fa-share-alt" ></i></span>
            
              <div class="modal fade" id="myModal">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <!-- Modal Header -->
                    <div class="modal-header">
                      <h4 class="modal-title" style="color: black;">Chia sẻ</h4>
                      <button type="button" class="close" data-dismiss="modal">
                        &times;
                      </button>
                    </div>

                    <!-- Modal body -->
                    <form action="" method="post">
                      <div class="modal-body">
                      <label for="inputNumber" style="color: black;">Nhập Email</label>
                      <input type="email" name="mailshare" class="form-control" required/>
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer">
                      <button formaction="./sharevd?idvd=${Videoid.id}" class="btn btn-primary"  >
                        Chia sẻ
                      </button>
                    </div>
                    </form>
                  
                  </div>
                </div>
              </div>
            </li>
          </ul>
        </div>
      </div>
    </div>
    <div class="col-lg-4 mb-4" style="padding: 0">
      <ul class="list-unstyled">
      <c:forEach var="listvd" items="${listvds}">
      <a href="./indexServlet?action=trangchitiet&idvideo=${listvd.id}" style="color: black;">
      <li class="media my-4">
          <div class="content">
            <div class="col-sm-5" style="float: left">
              <img src="views/images/${listvd.poster}" alt="Card image cap" width="180px" style="height: 90px" />
            </div>
            <div class="col-sm-7" style="float: right">
              <h6>${listvd.title}</h6>
              <p>
             ${listvd.views} lượt xem 
              </p>
            </div>
          </div>
        </li>
      </a>
        
        </c:forEach>
    
      </ul>
    </div>
  </div>
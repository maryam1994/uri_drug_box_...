# prow = Prow.last
#     time_arr = Hash.new
#     for i in 1..24/prow.period.to_i do
#     	byebug
#       time_arr[i] = prow.start_time + i*prow.period.to_i.hours
#     end


<!DOCTYPE html>
<html>
<head>
    <title>ظرف داروی هوشمند</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <%= stylesheet_link_tag    'application', media: 'all', 'data-turbolinks-track' => true %>
    <%= javascript_include_tag 'application', 'data-turbolinks-track' => true %>
    <%= csrf_meta_tags %>

</head>
<body>
<!-- <div class="page-loader"></div> -->
    
<!-- <div id="page" class="hfeed site"> -->
    <div class="l-sidebar-left l-header-wrap">
            <header id="masthead" class="m-site-header" role="banner">
                <div class="m-site-info">
                    <img src="/assets/drug_box/logo2.gif">
                </div>
                <div class="m-current-user-actions">
                    <% if user_signed_in? %>
                        <ul class="user-actions">
                            <li><%= link_to "تغییر رمز عبور", edit_user_registration_path%></li>
                        <% if !current_user.profile.blank? %>
                            <li><%= link_to "ویرایش مشخصات", edit_profile_path(current_user.profile.id,:title => "edit") %></li>
                            <% if !current_user.relatives.blank? %>
                                <li><%= link_to "نزدیکان شما", relatives_path , :remote => true%></li>
                            <% else %>
                                <li><%= link_to "به نزدیکان خود بیافزایید", new_relative_path(:title => "new") , :remote => true %></li>
                            <% end %>
                            <li><%= link_to "روش یادآوری", notifications_path, :remote => true %></li>
                            <li><%= link_to "نسخه ها", prescriptions_path, :remote => true %></li>
                            <li><%= link_to "افزودن دارو", new_prow_path(:title => "new") , :remote => true %></li>
                        <% else %>
                            <li><%= link_to "ایجاد پروفایل", new_profile_path(:title => "new") ,:remote => true %></li>
                        <% end %>
                        </ul>
                    <% end %>
                </div>
                <!-- /#sidebar-wrapper -->
            </header><!-- #masthead -->
        </div><!-- header-wrap -->
            
        <div class="l-cont-side-wrap">
            <div class="l-navigation-wrap background-theme-color">
                    <div class="navbar-collapse collapse navbar-inverse-collapse">
                        <% if user_signed_in? and !current_user.profile.blank? %>
                            <div class="span5" style= 'color:#FFF;'><%=  (' سلام' + current_user.profile.name)%></div>
                        <% end %>
                        <div class="span5 float">
                            <% if user_signed_in? %>
                                <div><%= link_to 'خروج از حساب کاربری', destroy_user_session_path, :method => :delete , :style=>'color:#FFF;'  %></div>
                            <% else %>
                                <div><%= link_to 'ورود', new_user_session_path , :style=>'color:#FFF;' %>  |  <%= link_to 'ایجاد حساب کاربری', new_user_registration_path , :style=>'color:#FFF;'  %></div>
                            <% end %>
                        </div>
                        <div class="navbar-collapse collapse navbar-inverse-collapse ">
                            <ul class="nav navbar-nav float">
                                <li><%= link_to 'خرید ظرف دارو', root_path%></li>
                                <li><%= link_to 'تماس با ما', root_path%></li>
                                <li><%= link_to 'صفحه اصلی', root_path%></li>
                            </ul>
                        </div><!-- /.nav-collapse -->
            </div><!-- /.navbar -->
        </div><!-- l-menu-wrap -->
    </div>
    <div class="l-page-wrap">
        <div class="l-content-wrap">
            <div id="main-container" class="container">
                    <%= yield %>
            </div>
        </div>
    </div>
        <!-- <div id="page-content-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                    </div>
                </div>
            </div>
        </div> -->

<!-- </div> -->
<script type="text/javascript">

jQuery(window).load(function() {

  jQuery('.flexslider').flexslider({
    animation: "fade",
    slideshow: false,
    smoothHeight: false,
    controlNav: false,
    prevText: "",
    nextText: "",
    directionNav: true,
    start: function(slider) {
      slider.removeClass('loading');
    }
  });

  jQuery('.flexslider-carousel').flexslider({
    animation: "slide",
    slideshow: true,
    smoothHeight: true,
    directionNav: true,
    controlNav: false,
    prevText: '',
    nextText: '',
    itemWidth: 280,
    itemMargin: 26,
    minItems: 3,
    maxItems: 5,
    move: 3
  });

  
});
</script>


</body>
</html>

<%= render 'shared/user_nav' %>
<div class="container">
    <div class="row mt-5">
        <div class="col-md-11">
            <table class="table table-striped table-hover table-bordered">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Action</th>
                    </tr>    
                </thead>
                <tbody>
                    <% @enquiries.each do |enquiry| %>
                        <tr>
                            <td><%= enquiry.name %></td>
                            <td><%= enquiry.email %></td>
                            <td>
                                <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#messageModal<%= enquiry.id %>">View Message</button>
                            </td>
                        </tr>
                    <% end %>
                </tbody>
            </table>
        </div>
    </div>                   
</div>

<% @enquiries.each do |enquiry| %>
    <div class="modal fade" id="messageModal<%= enquiry.id %>" tabindex="-1" aria-labelledby="messageModalLabel<%= enquiry.id %>" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="messageModalLabel<%= enquiry.id %>">Message from <%= enquiry.name %></h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <%= enquiry.message %>
                </div>
            </div>
        </div>
    </div>
<% end %>

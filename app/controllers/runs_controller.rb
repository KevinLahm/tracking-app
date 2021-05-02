class RunsController < ApplicationController

  get "/runs" do
    redirect_if_not_logged_in
    @runs = Run.all
    erb :"/runs/index"
  end

  get "/runs/new" do
    redirect_if_not_logged_in
    @error_message = params[:error]
    erb :"/runs/new"
  end

  post "/runs" do
    redirect_if_not_logged_in

    unless Run.valid_params?(params)
      redirect "/runs/new?error=invalid run"
    end
    Run.create(params)
    redirect "/runs"
  end

  get "/runs/:id" do
    redirect_if_not_logged_in
    @run = Run.find(params[:id])
    erb :"/runs/show"
  end

  get "/runs/:id/edit" do
    redirect_if_not_logged_in
    @error_message = params[:error]
    @run = Run.find(params[:id])
    erb :"/runs/edit"
  end

  post "/runs/:id" do
    redirect_if_not_logged_in
    @run = Run.find(params[:id])
    unless Run.valid_params?(params)
      redirect "/runs/#{@run.id}/edit?error=invalid run"
    end
    @run.update(params.select{|k|k=="distance" || k=="duration" || k=="date"})
    redirect "/runs/#{@run.id}"
  end

  delete('/runs/:id') do
    Run.find(params[:id]).destroy
    redirect('/runs')
  end

end

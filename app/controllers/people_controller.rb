class PeopleController < ApplicationController

    def index 
        @people = Person.all
    end

    def show
        @person = Person.find(params[:id])
        @child = Person.where("parent = '" + @person.name + "'")    
    end

    def edit
        @person = Person.find(params[:id])        
     end
  
     def update
        @person= Person.find(params[:id])
        if @person.update(person_params)
            redirect_to person_path
        else
            render :edit
        end
     end

    def new
        @person = Person.new
    end

    def create 
        @person = Person.create(person_params)
        if @person.save    
            redirect_to @person
            flash[:notice] = "Record successfully created"   
        else
            render 'new'
        end
    end

    def destroy
        @person = Person.find(params[:id])
        @person.destroy
        redirect_to people_path
    end

    private def person_params
        params.require(:person).permit(:name, :parent)
    end

    
end

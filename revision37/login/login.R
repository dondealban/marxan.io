#### Log in module ###
USER <- reactiveValues(Logged = Logged)

passwdInput <- function(inputId, label)
{
    tagList(
            tags$label(label),
            tags$input(id = inputId, type="password", value="")
    )
}

output$uiBanner <- renderUI({
    if (USER$Logged == FALSE)
    {
        headerPanel(
                    HTML("<p><a href='http://marxan.org' target='_blank'><img style='margin: 0px 20px' src='http://marxan.net/logos/MARXANLOGO.png' alt='Marxan logo'></a> <a href='http://www.ceed.edu.au/' target='_blank'><img src='http://marxan.net/logos/CEEDLOGO.png' alt='ARC CEED logo'></a></p> <h3>Marxan.net: Cloud infrastructure for systematic conservation planning</h3>"),
                    windowTitle="Marxan.net"
        )
    }
})

output$uiLogin <- renderUI({
    if (USER$Logged == FALSE)
    {
        wellPanel(
                  textInput("userName", "Username:"),
                  passwdInput("passwd", "Password:"),
                  br(),
                  actionButton("Login", "Log in")
        )
    }
})

output$pass <- renderText({
    if (USER$Logged == FALSE)
    {
        if (!is.null(input$Login))
        {
            cat(paste0("\n input$Login ",input$Login," iLogin ",iLogin,"\n\n"))
            AppendLogFile(sAnonLogFile,paste0("input$Login ",input$Login))

            #if ((input$Login == iLogin) & (input$Login > 0)) { iLogin <- 0 }

            if (input$Login > 0)
            {
                #iLoginClick <<- input$Login
                # isolate evaluates the expression without causing the reactive scope of the caller to be re-evaluated
                Username <- isolate(input$userName)
                Password <- isolate(input$passwd)

                cat(paste0("Username ",Username," Password ",Password,"\n"))
                AppendLogFile(sAnonLogFile,paste0("Username ",Username," Password ",Password))

                spwdfile <- paste0(sShinyPath,"/passwd/",Username)
                if (file.exists(spwdfile))
                {
                    load(file=spwdfile)

                    # does password match?

                } else {
                    # user doesn't exist

                }
                # PASSWORD is loaded from users password file
                Id.username <- which(PASSWORD$username == Username)
                Id.password <- which(PASSWORD$password == Password)

                # Id.password is loaded from users password file
                cat(paste0("Username ",Username," Password ",Password,"\n"))
                AppendLogFile(sAnonLogFile,paste0("Id.username ",Id.username," Id.password ",Id.password))

                if (length(Id.username) > 0 & length(Id.password) > 0)
                {
                    if (Id.username == Id.password)
                    {
                        USER$Logged <- TRUE

                        sUserName <<- Username

                        cat(paste0("User authenticated Id.username ",Id.username," Id.password ",Id.password,"\n"))
                        AppendLogFile(sAnonLogFile,paste0("User authenticated Id.username ",Id.username," Id.password ",Id.password))

                        InitialiseUser()
                    }
                } else  {
                    "User name or password invalid."
                    iWrongPassword <<- iWrongPassword + 1

                    cat(paste0("User not authenticated iWrongPassword ",iWrongPassword," Id.username ",Id.username," Id.password ",Id.password,"\n"))
                    AppendLogFile(sAnonLogFile,paste0("User not authenticated iWrongPassword ",iWrongPassword," Id.username ",Id.username," Id.password ",Id.password))

                }
            }
        }
    }
})

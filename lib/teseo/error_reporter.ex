defmodule Teseo.ErrorReporter do
  defstruct http_code: "", error_id: "", headers: "",message: "", stage: "", error_details: "", code: "" 

  def report(stage,error_details,headers,client_opts \\ []) do
    {:ok,error_encode} = Poison.encode(error_details)
    {:ok,headers_encode} = Poison.encode(headers)

    teseo_error = %Teseo.Error{code: to_string(internal_codes[stage]), 
                stage: to_string(stage), 
              message: error_messages[stage],
      request_headers: headers_encode,
            http_code: to_string(http_codes[stage]),
            client_id: client_opts[:client_id],
              user_id: client_opts[:user_id],
         request_body: to_string(client_opts[:body]),
        error_details: error_encode}
    saved_error = Teseo.Repo.insert(teseo_error)
    %Teseo.ErrorReporter{http_code: http_codes[stage], 
                          error_id: saved_error.id, 
                           headers: headers,
                           message: error_messages[stage], 
                             stage: stage,
                     error_details: error_details,
                              code: 1401}
  end


  def response(error) do
   %{error_id: error.error_id,
     code: error.code,
     stage: error.stage,
     message: error.message,
     request_headers: error.headers,
     error_details: error.error_details}
  end

  defp http_codes do
    Application.get_env(:teseo, :stage_http_codes)
  end

  defp error_messages do
    Application.get_env(:teseo, :stage_error_messages)
  end

  defp internal_codes do
    Application.get_env(:teseo, :internal_codes)
  end

  
end
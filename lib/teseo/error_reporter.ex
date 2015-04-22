defmodule Teseo.ErrorReporter do
  
  def report(stage,error_details,headers) do
    %Teseo.Error{code: internal_codes[stage], 
                stage: stage, 
              message: error_messages[stage],
      request_headers: headers,
            http_code: http_codes[stage],
            client_id: 34,
         request_body: "body",
        error_details: error_details}
  end


  def response(error) do
   %{code: error.code,
     stage: error.stage,
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
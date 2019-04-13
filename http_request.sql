SET SERVEROUTPUT ON;

DECLARE
    l_req   UTL_HTTP.req;
    l_resp  UTL_HTTP.resp;
    l_resp_text  VARCHAR2 (32767);

BEGIN 
    l_req  := UTL_HTTP.begin_request ('http://www.google.com/', 'GET' );
    l_resp := UTL_HTTP.get_response(l_req);

         
    LOOP
        UTL_HTTP.read_text(l_resp, l_resp_text, 32766);
      DBMS_OUTPUT.put_line(l_resp_text);
    END LOOP;
    EXCEPTION
        WHEN UTL_HTTP.end_of_body THEN
        UTL_HTTP.end_response(l_resp);
END;



unit UsoGeralRH;

interface

uses SysUtils, Dialogs, Forms, StdCtrls, DB, DBTables, Controls, Classes, Wwquery;

procedure UsuXfilialXcc(const RegPessoa: string);

var
  sUsuXfilial, sUsuXccusto: string;
  qryUsuXfilialXcc        : TwwQuery;

implementation

uses uSistema;

procedure UsuXfilialXcc(const RegPessoa: string);
begin
  if (Sistema.FezLogin) then
  begin
    sUsuXfilial:=''; sUsuXccusto:='';

    qryUsuXfilialXcc := TwwQuery.Create(Application);
    qryUsuXfilialXcc.DataBaseName := 'Basedados';

    qryUsuXfilialXcc.Close;
    with (qryUsuXfilialXcc.SQL) do
    begin
      Clear;
      Add('SELECT *');
      Add('FROM   AUTORIZA A, OPERFUNC O, FUNCAO F');
      Add('WHERE  (A.IDPESSOA    = ' +IntToStr(Sistema.idEmpresa)+ ') AND');
      Add('       (A.IDESPACESSO = ' +IntToStr(Sistema.IdEspAcesso)+ ') AND');
      Add('       (F.NOMEFUNCAO  LIKE ''Usu%rio RH'') AND');
      Add('       (F.IDMODULO    = ' +IntToStr(Sistema.IdModulo)+ ') AND');
      Add('       (A.IDOPERFUNC  = O.IDOPERFUNC) AND');
      Add('       (O.IDFUNCAO    = F.IDFUNCAO)');
    end;

    qryUsuXfilialXcc.Open;
    if not(qryUsuXfilialXcc.IsEmpty) then // Usuário RH
    begin
      qryUsuXfilialXcc.Close;
      qryUsuXfilialXcc.Free;
      exit;
    end;

    qryUsuXfilialXcc.Close;
    qryUsuXfilialXcc.SQL.Clear;
    qryUsuXfilialXcc.SQL.Add('SELECT CODCENTROCUSTO ' +
                             'FROM   USCCUSTO ' +
                             'WHERE  (IDUSUARIO = ' +RegPessoa+ ') AND'+
                             '       (IDEMPRESA = ' +IntToStr(Sistema.idEmpresa)+ ')');
    qryUsuXfilialXcc.Open;

    if (qryUsuXfilialXcc.IsEmpty) then
      sUsuXccusto := ''
    else
    begin
      while not(qryUsuXfilialXcc.EOF) do
      begin
        if (sUsuXccusto <> '') then
          sUsuXccusto := sUsuXccusto +',';
        sUsuXccusto := sUsuXccusto +
          QuotedStr(qryUsuXfilialXcc.FieldByName('CODCENTROCUSTO').asString);
        qryUsuXfilialXcc.Next;
      end;
    end;

    if (sUsuXccusto <> '') then
      if (Pos(',',sUsuXccusto) > 0) then
        sUsuXccusto := '(' +sUsuXccusto+ ')';

    qryUsuXfilialXcc.Close;
    qryUsuXfilialXcc.SQL.Clear;
    qryUsuXfilialXcc.SQL.Add('SELECT IDFILIALPESSOA '+
                             'FROM   USUARIOXFILIAL '+
                             'WHERE (IDUSUARIO = ' +RegPessoa+ ')');
    qryUsuXfilialXcc.Open;

    if (qryUsuXfilialXcc.IsEmpty) then
      sUsuXfilial := ''
    else
    begin
      while not(qryUsuXfilialXcc.EOF) do
      begin
        if (sUsuXfilial <> '') then
          sUsuXfilial := sUsuXfilial + ',';

        sUsuXfilial := sUsuXfilial + qryUsuXfilialXcc.FieldByName('IDFILIALPESSOA').asString;
        qryUsuXfilialXcc.Next;
      end;
    end;

    if (sUsuXfilial <> '') then
      if (Pos(',',sUsuXfilial) > 0) then
        sUsuXfilial := '(' +sUsuXfilial+ ')';

    qryUsuXfilialXcc.Close;
    qryUsuXfilialXcc.Free;
  end;
end;

end.

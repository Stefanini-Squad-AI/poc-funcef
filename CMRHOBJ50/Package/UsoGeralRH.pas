unit UsoGeralRH;

interface

uses SysUtils, Dialogs, Forms, StdCtrls, DB, DBTables, Controls, Classes, Wwquery;

procedure UsuXfilialXcc(const RegPessoa: string);

var
  sUsuXfilial, sUsuXccusto, sUsoGeralIdPessoa: string;
  qryUsuXfilialXcc: TwwQuery;
  bFezLogin, bUsuarioRH: boolean;
  IdEmpresa: integer;

implementation

procedure UsuXfilialXcc(const RegPessoa: string);
begin
  if (bFezLogin) then
  begin
    sUsuXfilial := '';
    sUsuXccusto := '';
    sUsoGeralIdPessoa := '';

    //if (frmPrincipal.UsuarioRH.Enabled) then exit; // Usuário RH
    if (bUsuarioRH) then // Usuário RH
      exit;

    qryUsuXfilialXcc := TwwQuery.Create(Application);
    qryUsuXfilialXcc.DataBaseName := 'Basedados';

    qryUsuXfilialXcc.Close;
    qryUsuXfilialXcc.SQL.Clear;
    try
      qryUsuXfilialXcc.SQL.Add('SELECT CODCENTROCUSTO ' +
                               'FROM   USCCUSTORH ' +
                               'WHERE  (IDUSUARIO = ' +RegPessoa+ ') AND'+
                               '       (IDEMPRESA = ' +IntToStr(IdEmpresa)+ ')');
      qryUsuXfilialXcc.Open;
    except
      qryUsuXfilialXcc.Close;
      qryUsuXfilialXcc.SQL.Clear;
      qryUsuXfilialXcc.SQL.Add('SELECT CODCENTROCUSTO ' +
                               'FROM   USCCUSTO ' +
                               'WHERE  (IDUSUARIO = ' +RegPessoa+ ') AND'+
                               '       (IDEMPRESA = ' +IntToStr(IdEmpresa)+ ')');
      qryUsuXfilialXcc.Open;
    end;

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

    if (sUsuXfilial = '') and (sUsuXccusto = '') then
       sUsoGeralIdPessoa := RegPessoa;

  end;
end;

end.

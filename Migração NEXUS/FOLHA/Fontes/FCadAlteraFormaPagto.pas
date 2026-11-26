// *************************************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ********************************************
// *************************************************************************************************
// Autor(a)    : Claudio Faria
// Data        : 04/06/2007
// Rotina      : bbtnOkDetClick
// Pendência   : 21237
// Descricao   : Tratar a previa quando for alterado o codportforma
//------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 04/09/2006 a 08/09/2006
// Rotina      : bbtnOkDetClick
// Pendência   : 19933
// Descricao   : PERMITIR ALTERAÇÃO DE PORTADOR FORMA DE BENEFÍCIOS JÁ ENCERRADOS
//------------------------------------------------------------------------------
//  Autor(a)   :
//  Rotina     :
//  Data       :
//  Pendencia  :
//  Alteração  :
// -------------------------------------------------------------------------------------------------

unit FCadAlteraFormaPagto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, CmEventosCadastro, ImgList, MontaSelect, DBTables,
  IvDictio, IvMulti, IvEMulti, Db, Wwdatsrc, Wwquery, MAHlpBtn, TB97Tlbr,
  StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  UMensErro, TabControlDetalhe, ExtCtrls, Mask, DBCtrls, wwdblook, uSistema,
  uDataBase;

type
  TFrmCadAlteraFormaPagto = class(TfrmCadMestreDetalheCS)
    dbeNomeTitular: TDBEdit;
    Label1: TLabel;
    qryBancoPortador: TwwQuery;
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    cmbPortador: TwwDBLookupCombo;
    qryAtualiza: TwwQuery;
    dbeNomeRecebedor: TDBEdit;
    qryDetNOME: TStringField;
    qryDetIDRECEBEDOR: TFloatField;
    qryDetIDTITULAR: TFloatField;
    qryDetTIPO: TStringField;
    qryDetDESCRTIPO: TStringField;
    qryDetDESCRPORTFORMA: TStringField;
    qryDetCODPORTFORMA: TFloatField;
    qryDetIDSITBENEFICIO: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure AbreqryDet;
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    iIdTitular,
    iIdPessoa    : Integer;
    bApagaPrevia : Boolean; 
  public
    { Public declarations }
  end;

var
  FrmCadAlteraFormaPagto: TFrmCadAlteraFormaPagto;

implementation

Uses dBaseDados, dFolha;

{$R *.DFM}

procedure TFrmCadAlteraFormaPagto.AbreqryDet;
begin
  qryDet.Close;
  qryDet.ParamByName('IdTitular').Value:=iIdTitular;
  qryDet.ParamByName('IdRecebedor').Value:=iIdPessoa;
  qryDet.Open;
end;

procedure TFrmCadAlteraFormaPagto.FormCreate(Sender: TObject);
begin
  inherited;
  qryBancoPortador.open;
  CmeDetalhe.RepetirInsert:=false;
  CmeCadastro.RepetirInsert:=false;
end;

procedure TFrmCadAlteraFormaPagto.CmeDetalheEdit(Sender: TObject);
begin
//  inherited;
end;

procedure TFrmCadAlteraFormaPagto.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  If not dtmBaseDados.dbBaseDados.inTransaction then
    dtmBaseDados.dbBaseDados.StartTransaction;
end;

procedure TFrmCadAlteraFormaPagto.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  If dtmBaseDados.dbBaseDados.inTransaction then
  begin
    dtmBaseDados.dbBaseDados.Rollback;
    AbreqryDet;
  end;
end;

procedure TFrmCadAlteraFormaPagto.CmeCadastroConfirma(Sender: TObject);
begin
  FazerVoltarDet;
  If dtmBaseDados.dbBaseDados.inTransaction then
    dtmBaseDados.dbBaseDados.Commit;
end;

procedure TFrmCadAlteraFormaPagto.bbtnOkDetClick(Sender: TObject);
 var ssqlB, ssqlH, ssqlR, ssqlP : String;
begin
  ssqlB       :='';
  ssqlH       :='';
  ssqlR       :='';
  ssqlP       :='';
  bApagaPrevia := False;

  qryAtualiza.close;

  // PARTPREVPLAN OU BFCIARIOTITPLAN
  If (qryDet.fieldbyname('TIPO').asString <> 'R') then
  begin

    If length(Trim(cmbPortador.text)) > 0 then
      ssqlB:='UPDATE BENEFBFCIARIO BF SET BF.CODPORTFORMA = '+InttoStr(qryBancoPortador.FieldByname('CODPORTFORMA').AsInteger)
    else
      ssqlB:='UPDATE BENEFBFCIARIO BF SET BF.CODPORTFORMA = NULL ';

    ssqlB:=ssqlB+' WHERE EXISTS (SELECT BC.IDPESSOA '+
                                'FROM BFCIARIOTITPLAN BC '+
                                'WHERE BC.IDTITULAR = BF.IDTITULAR '+
                                ' AND BC.IDPESSOA = BF.IDPESSOA '+
                                ' AND BC.IDRESPONSAVEL = '+inttostr(qryDet.fieldbyname('IDRECEBEDOR').asInteger)+
                                ' AND BC.IDPLANOPREV = BF.IDPLANOPREV '+
                                ' AND BC.IDBENEFICIO = BF.IDBENEFICIO '+
                                ' AND BC.IDPESSJUR = BF.IDPESSJUR) '+
                 ' AND BF.IDTITULAR = '+inttostr(qryDet.fieldbyname('IDTITULAR').asInteger)+
                 ' AND BF.IDSITBENEFICIO IN (1,2,3)';  

    If length(Trim(cmbPortador.text)) > 0 then
      ssqlH:='UPDATE HSTBENEFBFCIARIO HS SET HS.CODPORTFORMA = '+
         InttoStr(qryBancoPortador.FieldByname('CODPORTFORMA').AsInteger)
    else
      ssqlH:='UPDATE HSTBENEFBFCIARIO HS SET HS.CODPORTFORMA = NULL ';

    ssqlH:=ssqlH+' WHERE EXISTS (SELECT BC.IDPESSOA                      '+
                 '               FROM BFCIARIOTITPLAN BC                 '+
                 '               WHERE BC.IDTITULAR     = HS.IDTITULAR   '+
                 '                 AND BC.IDPESSOA      = HS.IDPESSOA    '+
                 '                 AND BC.IDRESPONSAVEL = ' + inttostr(qryDet.fieldbyname('IDRECEBEDOR').asInteger)+
                 '                 AND BC.IDPLANOPREV   = HS.IDPLANOPREV '+
                 '                 AND BC.IDBENEFICIO   = HS.IDBENEFICIO '+
                 '                 AND BC.IDPESSJUR     = HS.IDPESSJUR)  '+
                 '                 AND HS.IDTITULAR     = ' + inttostr(qryDet.fieldbyname('IDTITULAR').asInteger);

    If qryDet.FieldByName('IDSITBENEFICIO').AsInteger <> 3 Then   
       ssqlH := ssqlH + ' AND HS.VLBENEFPGTO IS NULL ' +
                        ' AND HS.FLGENVIADO IN (0,9) '
    Else
       ssqlH := ssqlH + ' AND HS.VLBENEFPGTO IS NOT NULL '+
                        ' AND HS.FLGENVIADO IN (1)       '; 

  end
  else  // RUBRICAINDIV
  begin

    if length(Trim(cmbPortador.text)) > 0 then
      ssqlR:='UPDATE RUBRICAINDIV SET CODPORTFORMA   = '+
        InttoStr(qryBancoPortador.FieldByname('CODPORTFORMA').AsInteger)
    else
      ssqlR:='UPDATE RUBRICAINDIV SET CODPORTFORMA = NULL ';

    ssqlR:=ssqlR+' WHERE IDFAVORECIDO = '+
      Inttostr(qrydet.fieldbyname('IDRECEBEDOR').asinteger)+
                 ' AND IDTITULAR = '+Inttostr(qrydet.fieldbyname('IDTITULAR').asinteger)+
                 ' AND FLGPENSAOALIM = 1';

  end;

  sSqlP := ' DELETE ' + #13 +
           ' FROM PREVIA ' + #13 +
           ' WHERE IDRESPONSAVEL = ' + IntToStr( qryDet.FieldByName('IDRECEBEDOR').AsInteger) + #13 +
           '   AND IDTITULAR     = ' + IntToStr( qryDet.FieldByName('IDTITULAR').AsInteger)   + #13 +
           '   AND IDLOTE        = (SELECT DISTINCT H.IDLOTE ' + #13 +
           '                        FROM HSTBENEFBFCIARIO H ' + #13 +
           '                        WHERE H.IDTITULAR     = ' + IntToStr( qryDet.FieldByName('IDTITULAR').AsInteger)   + #13 +
           '                          AND H.FLGENVIADO    = 0 ' + #13 +
           '                          AND H.IDLOTE IS NOT NULL) ';

  try
    If ssqlB <> '' then
    begin
      qryatualiza.sql.clear;
      qryatualiza.SQL.add(ssqlB);
      qryatualiza.execsql;
    end;
  except
    on e:Exception do
    begin
      MostrarErro(E);
      exit;
    end;
  end;

  try
    If ssqlH <> '' then
    begin
      qryatualiza.sql.clear;
      qryatualiza.SQL.add(ssqlH);
      qryatualiza.execsql;
    end;
  except
    on e:Exception do
    begin
      MostrarErro(E);
      exit;
    end;
  end;

  try
    If ssqlR <> '' then
    begin
      qryatualiza.sql.clear;
      qryatualiza.SQL.add(ssqlR);
      qryatualiza.execsql;
    end;
  except
    on e:Exception do
    begin
      MostrarErro(E);
      exit;
    end;
  end;

  try
    If ssqlP <> '' then
    begin
      qryatualiza.sql.clear;
      qryatualiza.SQL.add(ssqlP);
      qryatualiza.execsql;

      bApagaPrevia := True;  
    end;
  except
    on e:Exception do
    begin
      bApagaPrevia := False; 
      
      MostrarErro(E);  
      exit;
    end;
  end;

  FazerVoltarDet;

  AbreqryDet;
end;

procedure TFrmCadAlteraFormaPagto.CmeDetalheConfirma(Sender: TObject);
begin
  if (qryAtual <> nil ) and (qryAtual.State in [dsInsert, dsEdit]) then
  begin
    try
      qryAtual.Cancel;
      FazerVoltarDet;
    except
    end;
    CmeDetalhe.Atualizabotoes(Self);
  end;
end;

procedure TFrmCadAlteraFormaPagto.sbtnAltDetClick(Sender: TObject);
Var iCodPortForma: Integer;
begin
  inherited;
  cmbPortador.Text:='';
  cmbPortador.LookupValue:='';
  iCodPortForma:=StrToIntDef(qryDet.FieldByName('CODPORTFORMA').AsString,0);
  If qryBancoPortador.Locate('CODPORTFORMA',iCodPortForma,[]) then
  begin
    cmbPortador.Text:=qryBancoPortador.FieldByName('DESCRICAO').AsString;
    cmbPortador.LookupValue:=qryBancoPortador.FieldByName('CODPORTFORMA').AsString;
  end;
end;

procedure TFrmCadAlteraFormaPagto.CmeCadastroAtualizaBotoes(
  Sender: TObject);
begin
  inherited;
   If (qry.IsEmpty)Or(qryDet.IsEmpty) then
    sbtnAlterar.Enabled:=False;
end;

procedure TFrmCadAlteraFormaPagto.CmeCadastroBeforeConfirma(
  sender: TObject; var Accept: Boolean);
begin
  inherited;
  if not dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.StartTransaction;

  if not Sistema.GravaLogOperacoes('Cadastro Manual de Lançamentos da Folha de Benefícios.') then
    Raise Exception.Create('Não foi possível gravar o log.')
  else
    dtmBaseDados.dbBaseDados.Commit;
end;

procedure TFrmCadAlteraFormaPagto.sbtnProcurarClick(Sender: TObject);
begin
  dtmfolha.MSBenef.Executar;
    if (dtmfolha.MSBenef.ValoresChave.Count > 0) and
     (dtmfolha.MSBenef.ValoresChave[0] <> '') then
  begin
    iIdPessoa:=StrToIntDef(dtmfolha.MSBenef.ValoresChave[0],0);
    iIdTitular:=StrToIntDef(dtmfolha.MSBenef.ValoresChave[5],0);
    qry.Close;
    qry.ParamByName('IdPessoa').Value:=iIdTitular;
    qry.Open;
    AbreqryDet;
  end;
  sbtnAlterar.Enabled:=(Not qryDet.IsEmpty)And(Not qry.IsEmpty);
end;

procedure TFrmCadAlteraFormaPagto.bbtnConfirmarClick(Sender: TObject);
begin
  If bApagaPrevia Then
  Begin
     MsgDlg('Deverá ser refeita a previa individual para esse Titular', 'Informação', mtInformation, [mbOk], 0);
  End;
  inherited;
end;

end.
{==============================================================================|
| UNIT: FCADALTERAFORMAPAGTO                                                   |
| DESCRIÇÃO FUNCIONAL:                                                         |
|   CADASTRO DE FORMA DE PAGAMENTO PARA O TITULAR, BENEFICIARIOS E             |
|    CONSIGNATARIOS.                                                           |
|                                                                              |
|==============================================================================|
| DESENVOLVEDOR:  FERNANDO JORGE                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE 10/05/2002 A 10/05/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12p                                              |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|  - CRIACAO DA UNIT.                                                          |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR:  FERNANDO JORGE                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE 07/06/2002 A 07/06/2002                         |
| VERSÃO PARA LIBERAÇÃO:  3.02.12t                                             |
| CLIENTE: (SE REQUISITO FOI PEDIDO POR UM CLIENTE ESPECÍFICO)                 |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - COLOQUEI UMA CRITICA AVISANDO QUE QUANDO O BENEFICIO NÃO ESTIVER EM        |
|   SITUAÇÃO 1 OU 2, OU NÃO HOUVER UM CONSIGNATARIO, A ALTERAÇÃO DA FORMA DE   |
|   PAGAMENTO NÃO PODERÁ SER EFETUADA.                                         |                                    |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 12/06/2002 A 12/06/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.13A                                              |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - CORREÇÃO DA QRYDET, POIS VERSÕES DO ORACLE NÃO FUNCIONA SELECT EM DECODE.  |
| (REFORMULAÇÃO)                                                               |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: Sidnei B Marins                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE 26/07/2002 A 29/07/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FUNCEF)     Pendência 7898.                                        |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: Ajustes no MontaSelect e Opção  para pesquisar   |
|   por Recebedor.                                                             |
|  - Quando qryDet.IsEmpty não habilita o botão alterar.                       |                                      |
|  - Inclusão do parametro idrecebedor na qryDet.                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: Fernando Jorge                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 17/09/2002 A 17/09/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FCRT)                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|  - Alterei o montaselect para permitir que sejam selecionadas pessoas que    |
|    estejam canceladas no plano. Isto por causa das folhas de resgate de      |
|    reserva.                                                                  |
|------------------------------------------------------------------------------|                                                                                   |
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 06/06/2003 A 06/06/2003                         |
| PENDÊNCIA: 14189                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.03.05e                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| COLOCAR FILTRO DO CAMPO IDMODULO DA FOLHA NAS CONSULTAS DA BANCOPORTORMA.    |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR:                                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE DD/MM/AAAA A DD/MM/AAAA                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (SE REQUISITO FOI PEDIDO POR UM CLIENTE ESPECÍFICO)                 |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|                                                                              |
|                                                                              |
|==============================================================================}


{Alterações
--------------------------------------------------------------------------------
Pendência     : SOL 241924 PPM 590036
Responsável   : William Moreira da Silva
Data          : 19/05/2015
Descrição     : Ajuste para o sistema suportar o campo DESCOPERACAO da tabelas LOGTOTALPREV
                Com 2000 caracteres(.DFM)
--------------------------------------------------------------------------------
Pendência     : SOL 163624   Kintana 1399837
Responsável   : Edilaine Ferraresi
Data          : 26/01/2012
Descrição     : Ajustar a funcionalidade de valor máximo de prestação para
                vincular ao contrato, ao invés de vincular ao mutuário.
--------------------------------------------------------------------------------
Pendência   : SOL 143037 Kintana 923244
Responsável : Renato Visoni
Descrição   : Criação do Histórico do Valor maximo de prestação.
--------------------------------------------------------------------------------

Pendência   : SOL 134670 Kintana 796612
Responsável : Renato Visoni
Descrição   :Criação da tela 'Valor Maximo Prestação Participante'
--------------------------------------------------------------------------------
}



unit FValorMaximoPrestacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroPai, CmEventosCadastro, ImgList, Db, Wwdatsrc, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97,
  ExtCtrls, Grids, DBGrids, TREdit, MontaSelect, DBTables,
  wwdbdatetimepicker, CMDateTimePicker,DBaseDados, ComCtrls, Wwdbigrd,
  Wwdbgrid;

type
  TFrmValorMaximoPrestacao = class(TfrmCadastroPai)
    Label1: TLabel;
    edtMatricula: TEdit;
    Label2: TLabel;
    edtMutuario: TEdit;
    Label3: TLabel;
    edtVlrMaxPrest: TRealEdit;
    DBGrid1: TDBGrid;
    Label4: TLabel;
    MS: TMontaSelect;
    dsContratos: TDataSource;
    QryContratos: TQuery;
    edtData: TCMDateTimePicker;
    Label5: TLabel;
    QryMaxPrestEp: TQuery;
    QryUpd: TQuery;
    edtObservacao: TRichEdit;
    dsMaxPrestEp: TDataSource;
    Label6: TLabel;
    edtDataFim: TCMDateTimePicker;
    QryAux: TQuery;
    PageControl1: TPageControl;
    tbHistorico: TTabSheet;
    DBGrid2: TDBGrid;
    tbUsuario: TTabSheet;
    DBGrid3: TDBGrid;
    dsHistAlteracao: TDataSource;
    QryHistAlteracao: TQuery;
    wwDBGrid1: TwwDBGrid;
    QryHistAlteracaoDESCOPERACAO: TMemoField;
    QryHistAlteracaoUSUARIO: TStringField;
    QryHistAlteracaoDATA: TDateTimeField;
    procedure sbtnProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure LimpaCampos();
    procedure sbtnApagarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryMaxPrestEpAfterScroll(DataSet: TDataSet);
    procedure AtualizaLog();
    procedure QryContratosAfterScroll(DataSet: TDataSet);
    procedure QryMaxPrestEpAfterOpen(DataSet: TDataSet);
    procedure QryHistAlteracaoDESCOPERACAOGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure wwDBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmValorMaximoPrestacao: TFrmValorMaximoPrestacao;
  Operacao  : String;
  bAchou    : Boolean;
  sContrato : string;   // Edilaine - Sol 163624 / KTN 1399837

implementation

uses UMensErro, uFuncoesEmptmo,UDatabase,USistema;

{$R *.DFM}

procedure TFrmValorMaximoPrestacao.sbtnProcurarClick(Sender: TObject);
VAR
TXT : STRING;
begin
 // inherited;

  bAchou := False;
  MS.Executar;
  txt := ms.Text;

  if MS.RetornouValor then begin
    bAchou := True;
    edtMatricula.Text := MS.ValoresChave[0];
    edtMutuario.Text  := MS.ValoresChave[1]; 

    QryContratos.Close;
    //QryContratos.ParamByName('IDPESSOA').asString := MS.ValoresChave[3];  // Edilaine - Sol 163624 / KTN 1399837 - comentei
    QryContratos.ParamByName('IDCONTRATO').asString := MS.ValoresChave[4];  // Edilaine - Sol 163624 / KTN 1399837 -
    QryContratos.Open;

    // Edilaine - Sol 163624 / KTN 1399837 - colocado na propriedade SQL do componente
    {
    QryMaxPrestEp.Close;
    QryMaxPrestEp.SQL.Clear;
    QryMaxPrestEp.SQL.Add('SELECT V.ROWID,V.IDVALORMAXPRESTEP,V.VALORMAX,V.OBSERVACAO,V.DATAINICIO,V.DATAFIM,');
    QryMaxPrestEp.SQL.Add('TRUNC(V.TRGDTINCLUSAO) AS DATAEVENTO,');
    QryMaxPrestEp.SQL.Add('(SELECT NOME FROM PESSOA P WHERE P.IDPESSOA = SUBSTR(V.TRGUSERINCLUSAO, 3, LENGTH(V.TRGUSERINCLUSAO))) AS USUARIO,  ');
    QryMaxPrestEp.SQL.Add('V.IDCONTRATOEMPTMO '); // Edilaine - Sol 163624 / KTN 1399837
    QryMaxPrestEp.SQL.Add('FROM VALORMAXPRESTEP V');
    //QryMaxPrestEp.SQL.Add('WHERE V.IDTITULAR ='+MS.ValoresChave[2]);  // Edilaine - Sol 163624 / KTN 1399837 - comentei
    //QryMaxPrestEp.SQL.Add('AND   V.IDPESSOA  ='+MS.ValoresChave[3]);  // Edilaine - Sol 163624 / KTN 1399837 - comentei
    QryMaxPrestEp.SQL.Add('AND   V.IDCONTRATOEMPTMO  = :IDCONTRATO');    // Edilaine - Sol 163624 / KTN 1399837
    QryMaxPrestEp.SQL.Add('ORDER BY DATAINICIO DESC');
    QryMaxPrestEp.Open;
    }
    // Edilaine - Sol 163624 / KTN 1399837 - fim

    // Edilaine - Sol 163624 / KTN 1399837 - trecho colocado no evento after scroll de qryContrato
    {
    if not QryMaxPrestEp.IsEmpty then begin
      edtVlrMaxPrest.Text := QryMaxPrestEp.FieldByname('VALORMAX').asString;
      edtData.Text        := QryMaxPrestEp.FieldByname('DATAINICIO').asString;
      edtDataFim.Text     := QryMaxPrestEp.FieldByname('DATAFIM').asString;
      edtObservacao.Text  := QryMaxPrestEp.FieldByname('OBSERVACAO').asString;


      sbtnAlterar.Enabled := True;

    end else begin
      edtVlrMaxPrest.Text :='';
      edtData.Text        :='';
      edtObservacao.Text  :='';

      sbtnAlterar.Enabled := False;

      sbtnAlterar.down := False;

    end;
    }
    // Edilaine - Sol 163624 / KTN 1399837 - fim

  end else begin
    LimpaCampos();
    sbtnAlterar.Enabled := False;
    sbtnAlterar.Down    := False;

    sbtnApagar.Enabled  := False; // Edilaine - Sol 163624 / KTN 1399837
    sbtnApagar.Down     := False; // Edilaine - Sol 163624 / KTN 1399837

    QryMaxPrestEp.Close; // Edilaine - Sol 163624 / KTN 1399837
  end;

  sbtnProcurar.down   := false; // Edilaine - Sol 163624 / KTN 1399837
  sbtnInserir.Enabled := True;  // Edilaine - Sol 163624 / KTN 1399837
  sbtnInserir.Down    := False; // Edilaine - Sol 163624 / KTN 1399837

  Operacao :='';

end;

procedure TFrmValorMaximoPrestacao.FormCreate(Sender: TObject);
begin
  inherited;

  sContrato := '-1';   // Edilaine - Sol 163624 / KTN 1399837

  //QryContratos.Close;
  //QryContratos.Open;
  
end;

procedure TFrmValorMaximoPrestacao.sbtnInserirClick(Sender: TObject);
begin
  //inherited;

  if bAchou = False then sbtnProcurar.Click;

  if bAchou then begin
    pnlFundo.Enabled       := True;
    edtData.enabled        := true; // Edilaine - Sol 163624 / KTN 1399837
    edtDataFim.enabled     := true; // Edilaine - Sol 163624 / KTN 1399837
    edtVlrMaxPrest.Text    := '';
    edtData.Text           := '';
    edtDataFim.Text        := '';
    edtObservacao.Text     := '';
    bbtnConfirmar.Enabled  := True;
    edtData.Date           := Now;
    Operacao               := 'I';
    sbtnInserir.Down       := True;
    sbtnProcurar.Enabled   := False; // Edilaine - Sol 163624 / KTN 1399837
    edtVlrMaxPrest.SetFocus;
    bAchou := False;
  end;

  sbtnProcurar.Down   := False;

  sbtnAlterar.Enabled := False;
  sbtnAlterar.Down    := False;

  sbtnApagar.Enabled  := False; // Edilaine - Sol 163624 / KTN 1399837
  sbtnApagar.Down     := False; // Edilaine - Sol 163624 / KTN 1399837

end;

procedure TFrmValorMaximoPrestacao.sbtnAlterarClick(Sender: TObject);
begin
  //inherited;

  pnlFundo.Enabled := True;
  edtVlrMaxPrest.SetFocus;
  edtData.enabled       := true;  // Edilaine - Sol 163624 / KTN 1399837
  edtDataFim.enabled    := true;  // Edilaine - Sol 163624 / KTN 1399837
  bbtnConfirmar.Enabled := True;
  Operacao :='A';

  sbtnAlterar.Enabled   := True;
  sbtnAlterar.Down      := True;
  sbtnInserir.Enabled   := False;
  sbtnInserir.Down      := False;
  sbtnApagar.Enabled    := False; // Edilaine - Sol 163624 / KTN 1399837
  sbtnApagar.Down       := False; // Edilaine - Sol 163624 / KTN 1399837
  sbtnProcurar.Enabled  := False; // Edilaine - Sol 163624 / KTN 1399837
  sbtnProcurar.Down     := False; // Edilaine - Sol 163624 / KTN 1399837
end;

procedure TFrmValorMaximoPrestacao.bbtnConfirmarClick(Sender: TObject);
var sMsg,sSQL : string;
begin
  //inherited;

  sMsg:='';
  sSQL:='';
  
  if Trim(edtMatricula.Text) = '' then begin
    sMsg :='É necessário indicar o Mutuário!';
  end;
  if edtVlrMaxPrest.Value < 0 then begin
    sMsg :='O campo Valor Máximo de Prestação é de preenchimento obrigatório.';
  end;
  if trim(edtData.Text)='' then begin
    sMsg :='O campo Data é de preenchimento obrigatório.';
  end;

  if edtDataFim.Text <> '' then begin
    if (edtDataFim.Date < edtData.Date)  then begin
      sMsg :='Data fim não pode ser menor que data inicio.';
    end;
  end;


  if (edtDataFim.Text = '') then
  begin
    //Verifica se a data que esta sendo cadastrada ja existe em algum intervalo de data que esta no banco
    QryAux.Close;
    QryAux.SQL.Clear;
    QryAux.SQL.Add(' SELECT * FROM VALORMAXPRESTEP ');
    //QryAux.SQL.Add(' WHERE IDTITULAR ='+MS.ValoresChave[2]); // Edilaine - Sol 163624 / KTN 1399837 - comentei
    //QryAux.SQL.Add(' AND   IDPESSOA  ='+MS.ValoresChave[3]); // Edilaine - Sol 163624 / KTN 1399837 - comentei
    QryAux.SQL.Add(' WHERE   IDCONTRATOEMPTMO ='+sContrato);    // Edilaine - Sol 163624 / KTN 1399837
    if Operacao = 'A' then begin
      QryAux.SQL.Add(' AND   ROWID <> ' + QuotedStr(QryMaxPrestEp.fieldByname('ROWID').asString));
    end;
    QryAux.SQL.Add(' AND '+ QuotedStr(edtData.text) +' BETWEEN DATAINICIO AND DATAFIM');
    QryAux.Open;

    if not QryAux.IsEmpty then begin
      sMsg :='Já existe um intervalo de data cadastrado para essa data inicial.';
    end;

    //Verificar se existe outro registro para a pessoa com a data final em branco
    QryAux.Close;
    QryAux.SQL.Clear;
    QryAux.SQL.Add(' SELECT * FROM VALORMAXPRESTEP ');
    //QryAux.SQL.Add(' WHERE IDTITULAR ='+MS.ValoresChave[2]);  // Edilaine - Sol 163624 / KTN 1399837 - comentei
    //QryAux.SQL.Add(' AND   IDPESSOA  ='+MS.ValoresChave[3]);  // Edilaine - Sol 163624 / KTN 1399837 - comentei
    QryAux.SQL.Add(' WHERE   IDCONTRATOEMPTMO = '+sContrato);    // Edilaine - Sol 163624 / KTN 1399837
    if Operacao = 'A' then begin
      QryAux.SQL.Add(' AND   ROWID <> ' + QuotedStr(QryMaxPrestEp.fieldByname('ROWID').asString));
    end;
    QryAux.SQL.Add(' AND DATAFIM IS NULL ');
    QryAux.Open;

    if not QryAux.IsEmpty then begin
      sMsg :='Já existe valor máximo cadastrado por prazo indeterminado.';
    end;

  end
  else
  begin
    //Verificar se o periodo de datas já não esta cadastrado.

    QryAux.Close;
    QryAux.SQL.Clear;
    QryAux.SQL.Add(' SELECT * ');
    QryAux.SQL.Add(' FROM VALORMAXPRESTEP ');
    //QryAux.SQL.Add(' WHERE IDTITULAR ='+MS.ValoresChave[2]); // Edilaine - Sol 163624 / KTN 1399837 - comentei
    //QryAux.SQL.Add(' AND   IDPESSOA  ='+MS.ValoresChave[3]); // Edilaine - Sol 163624 / KTN 1399837 - comentei
    QryAux.SQL.Add(' WHERE   IDCONTRATOEMPTMO  ='+sContrato);   // Edilaine - Sol 163624 / KTN 1399837
    if Operacao = 'A' then begin
      QryAux.SQL.Add(' AND   ROWID <> ' + QuotedStr(QryMaxPrestEp.fieldByname('ROWID').asString));
    end;
    QryAux.SQL.Add(' AND ((('+ QuotedStr(edtData.text) +' BETWEEN DATAINICIO AND DATAFIM) OR ('+ QuotedStr(edtDataFim.text) +' BETWEEN DATAINICIO AND DATAFIM)) OR ');
    QryAux.SQL.Add('     ((DATAINICIO BETWEEN '+ QuotedStr(edtData.text) +' AND '+ QuotedStr(edtDataFim.text) +') OR (DATAFIM BETWEEN '+ QuotedStr(edtData.text) +' AND '+ QuotedStr(edtDataFim.text) +')))');
    QryAux.Open;

    if not QryAux.IsEmpty then begin
      sMsg :='Já existe valor máximo cadastrado para esse período.';
    end;
  end;

  if (trim(sMsg)<>'') then begin
    MsgDlg(sMsg, 'Empréstimo', mtWarning, [mbOk], 0);
    Exit;
  end;

  if QryMaxPrestEp.Active then begin
    if not dtmBaseDados.dbBaseDados.InTransaction
      then dtmBaseDados.dbBaseDados.StartTransaction;

    if Operacao = 'I' then begin
      sSQL := ' INSERT INTO VALORMAXPRESTEP '+
              // Edilaine - Sol 163624 / KTN 1399837
              //'(IDVALORMAXPRESTEP,IDTITULAR,IDPESSOA,VALORMAX, OBSERVACAO,DATAINICIO,DATAFIM, '+
              '(IDVALORMAXPRESTEP, VALORMAX, OBSERVACAO, DATAINICIO, DATAFIM, IDCONTRATOEMPTMO '+
              // Edilaine - Sol 163624 / KTN 1399837 - fim
              ' ) VALUES ('+
                intTostr(LeUltRegistro(nil, 'VALORMAXPRESTEP'))+','+
                //MS.ValoresChave[2] +','+    // Edilaine - Sol 163624 / KTN 1399837 - comentei
                //MS.ValoresChave[3] +','+    // Edilaine - Sol 163624 / KTN 1399837 - comentei
                NumeroIngles(edtVlrMaxPrest.Value)+','+
                QuotedStr(edtObservacao.Text)+','+
                QuotedStr(edtData.Text)+','+
                QuotedStr(edtDataFim.Text)+','+
                sContrato+ // Edilaine - Sol 163624 / KTN 1399837
               ')';
    end else if Operacao = 'A' then begin
      if not QryMaxPrestEp.IsEmpty then begin
        sSQL := 'UPDATE VALORMAXPRESTEP SET '+
                '  VALORMAX      = '+ NumeroIngles(edtVlrMaxPrest.Value)+  // Edilaine - Sol 163624 / KTN 1399837 - comentei
                '  ,DATAINICIO   = '+ QuotedStr(edtData.Text)+
                '  ,DATAFIM      = '+ QuotedStr(edtDataFim.Text)+
                '  ,OBSERVACAO   = '+ QuotedStr(edtObservacao.Text)+
                ' WHERE ROWID    = '+ QuotedStr(QryMaxPrestEp.fieldByname('ROWID').asString);
      end;
    end;

    if sSQL <> '' then begin
      if Operacao = 'A' then begin
        AtualizaLog();
      end;

      QryUpd.Close;
      QryUpd.SQL.Clear;
      QryUpd.SQL.Add(sSQL);
      QryUpd.ExecSQL;
    end;
    if dtmBaseDados.dbBaseDados.InTransaction then begin
      dtmBaseDados.dbBaseDados.Commit;
    end;
  end;

  //bbtnCancelar.Click;
  QryMaxPrestEp.Close;
  QryMaxPrestEp.Open;

  sbtnAlterar.down     := False;
  sbtnInserir.down     := False;
  sbtnApagar.Down      := False; // Edilaine - Sol 163624 / KTN 1399837
  sbtnInserir.Enabled  := True;  // Edilaine - Sol 163624 / KTN 1399837
  sbtnProcurar.Enabled := True;  // Edilaine - Sol 163624 / KTN 1399837
  sbtnProcurar.Down    := False; // Edilaine - Sol 163624 / KTN 1399837

  if not QryMaxPrestEp.IsEmpty then begin
    sbtnAlterar.Enabled   := True;
    sbtnApagar.Enabled    := True; // Edilaine - Sol 163624 / KTN 1399837
    pnlFundo.Enabled      := False;
    bbtnConfirmar.Enabled := False;
  end else begin
    sbtnAlterar.Enabled   := False;
    sbtnApagar.Enabled    := False; // Edilaine - Sol 163624 / KTN 1399837
    pnlFundo.Enabled      := True;
    bbtnConfirmar.Enabled := true
  end;

end;

procedure TFrmValorMaximoPrestacao.bbtnCancelarClick(Sender: TObject);
begin
  //inherited;

  // Edilaine - Sol 163624 / KTN 1399837
  if Operacao = '' then
  begin
    LimpaCampos();
    QryMaxPrestEp.Close;
  end;

  pnlFundo.Enabled      := False;
  //sbtnAlterar.Enabled   := false; // Edilaine - Sol 163624 / KTN 1399837 - comentei
  sbtnAlterar.Enabled   := (QryMaxPrestEp.Active) and (not QryMaxPrestEp.isEmpty); // Edilaine - Sol 163624 / KTN 1399837
  bbtnConfirmar.Enabled := False;
  sbtnApagar.Enabled    := (QryMaxPrestEp.Active) and (not QryMaxPrestEp.isEmpty); // Edilaine - Sol 163624 / KTN 1399837
  sbtnProcurar.Enabled  := true;  // Edilaine - Sol 163624 / KTN 1399837
  sbtnInserir.Enabled   := (QryContratos.Active); // Edilaine - Sol 163624 / KTN 1399837

  sbtnInserir.Down      := False; // Edilaine - Sol 163624 / KTN 1399837
  sbtnApagar.Down       := False; // Edilaine - Sol 163624 / KTN 1399837
  sbtnAlterar.Down      := False;
  Operacao :='';
  
end;

procedure TFrmValorMaximoPrestacao.LimpaCampos;
begin

  edtMatricula.Text   :='';
  edtMutuario.Text    :='';
  edtVlrMaxPrest.Text :='';
  edtData.Text        :='';
  edtDataFim.text     :='';
  edtObservacao.Text  :='';
  QryContratos.Close;

end;

procedure TFrmValorMaximoPrestacao.sbtnApagarClick(Sender: TObject);
begin
  //inherited;

  // Edilaine - Sol 163624 / KTN 1399837
  sbtnAlterar.Enabled   := False;
  sbtnAlterar.Down      := False;
  sbtnInserir.Enabled   := False;
  sbtnInserir.Down      := False;
  sbtnApagar.Enabled    := True;
  sbtnApagar.Down       := True;
  // Edilaine - Sol 163624 / KTN 1399837 - fim

//  if MsgDlg('Deseja excluir o valor máximo de prestação cadastrado para este mutuário?', 'Empréstimo', mtWarning, [mbYes,mbNo], 0) = Id_yes then begin   // Edilaine - Sol 163624 / KTN 1399837 - comentei
  if MsgDlg('Deseja excluir o valor máximo de prestação cadastrado para este contrato?', 'Empréstimo', mtWarning, [mbYes,mbNo], 0) = Id_yes then begin     // Edilaine - Sol 163624 / KTN 1399837
    if QryMaxPrestEp.Active then begin
      if not dtmBaseDados.dbBaseDados.InTransaction then
        dtmBaseDados.dbBaseDados.StartTransaction;

      if not QryMaxPrestEp.IsEmpty then begin
        QryUpd.Close;
        QryUpd.SQL.Clear;
        QryUpd.SQL.Add(' DELETE FROM VALORMAXPRESTEP');
        QryUpd.SQL.Add(' WHERE ROWID = '+QuotedStr(QryMaxPrestEp.fieldByname('ROWID').asString));

        QryUpd.ExecSQL;

        dtmBaseDados.dbBaseDados.Commit;
      end;
    end;

    QryMaxPrestEp.Close;
    QryMaxPrestEp.Open;

    pnlFundo.Enabled      := False;
    //sbtnAlterar.Enabled   := False;    // Edilaine - Sol 163624 / KTN 1399837 - comentei
    //sbtnAlterar.Down      := False;    // Edilaine - Sol 163624 / KTN 1399837 - comentei
    //bbtnConfirmar.Enabled := False;    // Edilaine - Sol 163624 / KTN 1399837 - comentei
    //edtData.Enabled       := False;
    //edtObservacao.Enabled := False;
  end;

  // Edilaine - Sol 163624 / KTN 1399837
  sbtnInserir.Enabled   := True;
  sbtnAlterar.Enabled   := (not QryMaxPrestEp.isEmpty);
  sbtnApagar.Enabled    := (not QryMaxPrestEp.isEmpty);
  sbtnApagar.Down       := False;
  // Edilaine - Sol 163624 / KTN 1399837 - fim

  Operacao :='';
end;

procedure TFrmValorMaximoPrestacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if dtmBaseDados.dbBaseDados.InTransaction
    then dtmBaseDados.dbBaseDados.Commit;

end;

procedure TFrmValorMaximoPrestacao.QryMaxPrestEpAfterScroll(
  DataSet: TDataSet);
begin
  inherited;

  edtVlrMaxPrest.Text := QryMaxPrestEp.FieldByname('VALORMAX').asString;
  edtData.Text        := QryMaxPrestEp.FieldByname('DATAINICIO').asString;
  edtDataFim.Text     := QryMaxPrestEp.FieldByname('DATAFIM').asString;
  edtObservacao.Text  := QryMaxPrestEp.FieldByname('OBSERVACAO').asString;

  QryHistAlteracao.Close;
  QryHistAlteracao.ParamByname('IDVALORMAXPRESTEP').asinteger := QryMaxPrestEp.FieldByname('IDVALORMAXPRESTEP').asInteger;
  QryHistAlteracao.Open;

end;

procedure TFrmValorMaximoPrestacao.AtualizaLog();
var
  xQryLog: TQuery;
  iLogTotalPrev: Integer;
  sDescricao: String;
  i : Integer;
begin
  try

    if not dtmBaseDados.dbBaseDados.InTransaction then begin
      dtmBaseDados.dbBaseDados.StartTransaction;
    end;

    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add('SELECT * FROM VALORMAXPRESTEP');
    qryAux.SQL.Add('WHERE ROWID = '+QuotedStr(QryMaxPrestEp.fieldByname('ROWID').asString));
    qryAux.Open;

    for i := 0 to  qryAux.Fields.Count-1 do begin

      iLogTotalPrev := LeUltRegistro(nil, 'LOGTOTALPREV');
      sDescricao := '';

      if (UpperCase(qryAux.Fields[i].FieldName) = 'DATAINICIO') and (qryAux.FieldByname('DATAINICIO').asString <> edtData.Text) then begin
        sDescricao := 'Data Inicio Antes :'+ qryAux.FieldByname('DATAINICIO').asString +' - Data Inicio Depois:' + edtData.Text;
      end;
      if (UpperCase(qryAux.Fields[i].FieldName) = 'DATAFIM') and (qryAux.FieldByname('DATAFIM').asString <> edtDataFim.Text) then begin
        sDescricao := 'Data Fim Antes :'+ qryAux.FieldByname('DATAFIM').asString +' - Data Fim Depois:' + edtDataFim.Text;
      end;
      if (UpperCase(qryAux.Fields[i].FieldName) = 'VALORMAX') and (qryAux.FieldByname('VALORMAX').asFloat <> edtVlrMaxPrest.Value) then begin
        sDescricao := 'Valor Máximo Antes :'+ qryAux.FieldByname('VALORMAX').asString +' - Valor Máximo Depois:' + edtVlrMaxPrest.Text;
      end;
      if (UpperCase(qryAux.Fields[i].FieldName) = 'OBSERVACAO') and (qryAux.FieldByname('OBSERVACAO').asString <> edtObservacao.Text) then begin
        sDescricao := 'Observação Antes :'+ qryAux.FieldByname('OBSERVACAO').asString +' - Observação Depois:' + edtObservacao.Text;
      end;

      xQryLog := TQuery.Create(nil);
      if (sDescricao <> '') then begin
        with xQryLog do begin
          DataBaseName := 'BaseDados';
          Close;
          Sql.Clear;
          Sql.Add('INSERT INTO LOGTOTALPREV');
          Sql.Add('(IDLOGTOTALPREV, IDMODULO, DESCOPERACAO, IDUSUARIO, DATA, IDPESQUISA1)');
          Sql.Add('VALUES');
          Sql.Add('('+IntToStr(iLogTotalPrev)+', '+IntToStr(Sistema.IdModulo)+', '''+sDescricao+''', '+IntToStr(Sistema.IdUsuario)+', SYSDATE, '+qryAux.FieldByname('IDVALORMAXPRESTEP').asString+')');
          ExecSql;
        end;
      end;
    end;
  finally
    if dtmBaseDados.dbBaseDados.InTransaction then begin
      dtmBaseDados.dbBaseDados.Commit;
    end;
    FreeAndNil(xQryLog);
  end;
end;

// Edilaine - Sol 163624 / KTN 1399837
procedure TFrmValorMaximoPrestacao.QryContratosAfterScroll(
  DataSet: TDataSet);
begin
  inherited;

  if not QryContratos.IsEmpty then
  begin
    sContrato := qryContratos.FieldByName('IDCONTRATOEMPTMO').AsString;

    QryMaxPrestEp.Close;
    QryMaxPrestEp.SQL.Clear;
    QryMaxPrestEp.SQL.Add('SELECT V.ROWID, V.IDVALORMAXPRESTEP, V.VALORMAX, V.OBSERVACAO, V.DATAINICIO, V.DATAFIM,');
    QryMaxPrestEp.SQL.Add('TRUNC(V.TRGDTINCLUSAO) AS DATAEVENTO,');
    QryMaxPrestEp.SQL.Add('(SELECT NOME FROM PESSOA P WHERE P.IDPESSOA = SUBSTR(V.TRGUSERINCLUSAO, 3, LENGTH(V.TRGUSERINCLUSAO))) AS USUARIO, ');
    QryMaxPrestEp.SQL.Add('V.IDCONTRATOEMPTMO ');
    QryMaxPrestEp.SQL.Add('FROM VALORMAXPRESTEP V');
    QryMaxPrestEp.SQL.Add('WHERE  V.IDCONTRATOEMPTMO  = '+sContrato);
    QryMaxPrestEp.SQL.Add('ORDER BY DATAINICIO DESC');
    QryMaxPrestEp.Open;

    if not QryMaxPrestEp.isEmpty then begin
      edtVlrMaxPrest.Text := QryMaxPrestEp.FieldByname('VALORMAX').asString;
      edtData.Text        := QryMaxPrestEp.FieldByname('DATAINICIO').asString;
      edtDataFim.Text     := QryMaxPrestEp.FieldByname('DATAFIM').asString;
      edtObservacao.Text  := QryMaxPrestEp.FieldByname('OBSERVACAO').asString;

      sbtnAlterar.Enabled := True;
      sbtnAlterar.down    := False;
      sbtnApagar.Enabled  := true;    
      sbtnApagar.Down     := False;

    end else begin
      edtVlrMaxPrest.Text :='';
      edtData.Text        :='';
      edtObservacao.Text  :='';

      sbtnAlterar.Enabled := False;
      sbtnAlterar.down    := False;

      sbtnApagar.Enabled  := False;   
      sbtnApagar.Down     := False;   

    end;
  end
  else
    sContrato := '-1';

end;
// Edilaine - Sol 163624 / KTN 1399837 - fim


// Edilaine - Sol 163624 / KTN 1399837
procedure TFrmValorMaximoPrestacao.QryMaxPrestEpAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  (QryMaxPrestEp.FieldByName('VALORMAX') as TFloatField).currency := true;
end;
// Edilaine - Sol 163624 / KTN 1399837 - fim

procedure TFrmValorMaximoPrestacao.QryHistAlteracaoDESCOPERACAOGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
  inherited;
    //Text := Copy(QryHistAlteracaoDESCOPERACAO.AsString, 1, 50);
    Text := Sender.AsString;

    //wwDBGrid1.Columns[0]. := Sender.AsString;
end;

procedure TFrmValorMaximoPrestacao.wwDBGrid1DrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  inherited;
  //Canvas.FillRect(Sender.AsString;);
end;

end.


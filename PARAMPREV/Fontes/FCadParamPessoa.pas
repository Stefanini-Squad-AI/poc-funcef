// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//--------------------------------------------------------------------------------
//Nº SIG...........: 49442
//Data da Alteração: 19/01/2018
//Responsável......: Edilaine Ferraresi
//Descrição........: Mensagem de validações indevidas ao excluir lançamentos
//--------------------------------------------------------------------------------
//Pendência   : SOL 164235 Kintana 1409163
//Responsável : Vinicius Ferreira
//Data        : 27/12/2011
//Descrição   : Implementar trava para impedir a concessão de portabilidade ou resgate
//--------------------------------------------------------------------------------

unit FCadParamPessoa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCS, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls,
  DBCtrls, Mask, wwdbedit;

type
  TfrmCadParamPessoa = class(TFrmCadastroGridCS)
    dbrdTipo: TDBRadioGroup;
    dbedDescricao: TwwDBEdit;
    dbedValida: TwwDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    memoValor: TMemo;
    memoFlag: TMemo;
    wwDBEdit1: TwwDBEdit;
    qryAux: TwwQuery;
    DBMemo1: TDBMemo;
    Label4: TLabel;
    dbedMsgAlertaResgate: TwwDBEdit;
    dbedMsgImpedePortabilidade: TwwDBEdit;
    dbckImpedePortabilidade: TDBCheckBox;
    dbckAlertaResgate: TDBCheckBox;
    Label5: TLabel;
    Label6: TLabel;
    procedure dbrdTipoChange(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure qryBeforePost(DataSet: TDataSet);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure dbckAlertaResgateClick(Sender: TObject);
    procedure dbckImpedePortabilidadeClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadParamPessoa: TfrmCadParamPessoa;

implementation

Uses UDataBase, UMensErro, UAdmPrev, uCMTypes;   //edilaine - SIG49442
{$R *.DFM}

procedure TfrmCadParamPessoa.dbrdTipoChange(Sender: TObject);
begin
  inherited;
  dbedValida.Enabled := True;
  memoFlag.Visible   := False;
  memoValor.Visible  := False;
  if dbrdTipo.Value  = 'C' Then
     dbedValida.Enabled := False;
  if dbrdTipo.Value  = 'V' Then
  Begin
     memoValor.Visible := True;
     memoValor.BringtoFront;
  end;
  if dbrdTipo.Value  = 'F' Then
  Begin
     memoFlag.Visible := True;
     memoFlag.BringtoFront;
  end;
end;

procedure TfrmCadParamPessoa.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  pnlControles.Enabled := True;
  dbrdTipoChange(Sender);
  dbedDescricao.SetFocus;
  // SOL 164235 Kintana 1409163 - Vinicius Ferreira - Inicio
  If (dbckAlertaResgate.Checked) then begin
    Label5.Visible := True;
    dbedMsgAlertaResgate.Visible := True;
  end else begin
    Label5.Visible := False;
    dbedMsgAlertaResgate.Visible := False;
  end;

  If (dbckImpedePortabilidade.Checked) then begin
    Label6.Visible := True;
    dbedMsgImpedePortabilidade.Visible := True;
  end else begin
    Label6.Visible := False;
    dbedMsgImpedePortabilidade.Visible := False;
  end;
  // SOL 164235 Kintana 1409163 - Vinicius Ferreira - Fim
end;

procedure TfrmCadParamPessoa.qryBeforePost(DataSet: TDataSet);
begin
  if qry.State in [dsinsert]
  then begin
     qry.FieldByName('IDPARAM').AsInteger := LeUltRegistro(qryAux,'IDPARAM');
  end;
  qry.FieldbyName('IDFUNDACAO').AsInteger := iIdFundacao;
  inherited;
end;

procedure TfrmCadParamPessoa.CmeCadastroConfirma(Sender: TObject);
begin

  if CmeCadastro.Operacao <> opApagar then    //edilaine - SIG49442
  begin
    // SOL 164235 Kintana 1409163 - Vinicius Ferreira
     If (dbckAlertaResgate.Checked) and (dbedMsgAlertaResgate.Text = '') then begin
     MsgDlg('O campo mensagem não foi preenchido.','Informação',mtInformation,[mbOk,mbHelp],0);
     Abort;
     End;

     If (dbckImpedePortabilidade.Checked) and (dbedMsgImpedePortabilidade.Text = '')  then begin
     MsgDlg('O campo mensagem não foi preenchido.','Informação',mtInformation,[mbOk,mbHelp],0);
     Abort;
     End;

     If (dbrdTipo.Value = '') then begin
     MsgDlg('O tipo não foi preenchido.','Informação',mtInformation,[mbOk,mbHelp],0);
     Abort;
     End;

     If (dbedDescricao.text = '')  then begin
     MsgDlg('A descrição não foi preenchida.','Informação',mtInformation,[mbOk,mbHelp],0);
     Abort;
     End;

     If (DBMemo1.text = '') then begin
     MsgDlg('A Legenda não foi preenchida.','Informação',mtInformation,[mbOk,mbHelp],0);
     Abort;
     End;
    // VINISOL 164235 Kintana 1409163 - Vinicius Ferreira

    if (dbrdTipo.Value  = 'F') or
       (dbrdTipo.Value  = 'V') Then
    Begin
       if dbrdTipo.Value  = 'F' Then
       Begin
          qryAux.SQL.Text := 'SELECT 1 FROM DUAL WHERE ' + QuotedStr('1') + ' IN '+
                              Trim(dbedValida.Text) ;
          try
             qryAux.Open;
          except
             MsgDlg('Regra de Validação incorreta.','Informação',mtInformation,[mbOk,mbHelp],0);
             dbedValida.SetFocus;
             pnlControles.Enabled := False;
             Exit;
          end;
       end;
       if dbrdTipo.Value  = 'V' Then     
       Begin
          qryAux.SQL.Text := 'SELECT 1 FROM DUAL WHERE 1 ' +
                              Trim(dbedValida.Text);
          try
             qryAux.Open;
          except
             MsgDlg('Regra de Validação incorreta.','Informação',mtInformation,[mbOk,mbHelp],0);
             dbedValida.SetFocus;
             pnlControles.Enabled := False;
             Exit;
          end;
       end;
    end;
  end;  //edilaine - SIG49442
  
  pnlControles.Enabled := False;
  inherited;
  // SOL 164235 Kintana 1409163 - Vinicius Ferreira - Inicio
  If (dbckAlertaResgate.Checked) then begin
    Label5.Visible := True;
    dbedMsgAlertaResgate.Visible := True;
  end else begin
    Label5.Visible := False;
    dbedMsgAlertaResgate.Visible := False;
    dbedMsgAlertaResgate.Text := '';
  end;

  If (dbckImpedePortabilidade.Checked) then begin
    Label6.Visible := True;
    dbedMsgImpedePortabilidade.Visible := True;
  end else begin
    Label6.Visible := False;
    dbedMsgImpedePortabilidade.Visible := False;
    dbedMsgImpedePortabilidade.Text := '';
  end;
  // SOL 164235 Kintana 1409163 - Vinicius Ferreira - Fim
end;

procedure TfrmCadParamPessoa.FormShow(Sender: TObject);
begin
  inherited;
  MontaSelect.Filtro.Add('PARAMFLAGPESSOA.IDFUNDACAO = '+IntToStr(iIdFundacao));
end;

procedure TfrmCadParamPessoa.FormActivate(Sender: TObject);
begin
  inherited;
  pnlControles.Enabled := False;
end;

procedure TfrmCadParamPessoa.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then
  Begin
    qry.Close;
    qry.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao;
    qry.ParamByName('IDPARAM').AsInteger    := StrToInt(MontaSelect.ValoresChave[0]);
    qry.Open;

  // SOL 164235 Kintana 1409163 - Vinicius Ferreira - Inicio
  If (dbckAlertaResgate.Checked) then begin
    Label5.Visible := True;
    dbedMsgAlertaResgate.Visible := True;
  end else begin
    Label5.Visible := False;
    dbedMsgAlertaResgate.Visible := False;
  end;

  If (dbckImpedePortabilidade.Checked) then begin
    Label6.Visible := True;
    dbedMsgImpedePortabilidade.Visible := True;
  end else begin
    Label6.Visible := False;
    dbedMsgImpedePortabilidade.Visible := False;
  end;
  // SOL 164235 Kintana 1409163 - Vinicius Ferreira - Fim
  End;
  pnlControles.Enabled := False;
end;

procedure TfrmCadParamPessoa.CmeCadastroDelete(Sender: TObject);
begin
  inherited;
  pnlControles.Enabled := False;
end;

procedure TfrmCadParamPessoa.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  pnlControles.Enabled := True;
  dbckImpedePortabilidade.Checked := false;// SOL 164235 Kintana 1409163 - Vinicius Ferreira
  dbckAlertaResgate.Checked := false;// SOL 164235 Kintana 1409163 - Vinicius Ferreira
end;

procedure TfrmCadParamPessoa.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  pnlControles.Enabled := False;
  // SOL 164235 Kintana 1409163 - Vinicius Ferreira - Inicio
  If (dbckAlertaResgate.Checked) then begin
    Label5.Visible := True;
    dbedMsgAlertaResgate.Visible := True;
  end else begin
    Label5.Visible := False;
    dbedMsgAlertaResgate.Visible := False;
    dbedMsgAlertaResgate.Text := '';
  end;

  If (dbckImpedePortabilidade.Checked) then begin
    Label6.Visible := True;
    dbedMsgImpedePortabilidade.Visible := True;
  end else begin
    Label6.Visible := False;
    dbedMsgImpedePortabilidade.Visible := False;
    dbedMsgImpedePortabilidade.Text := '';
  end;
  // SOL 164235 Kintana 1409163 - Vinicius Ferreira - Fim
  qry.Close;
end;

procedure TfrmCadParamPessoa.dbckAlertaResgateClick(Sender: TObject); // SOL 164235 Kintana 1409163 - Vinicius Ferreira
begin
  inherited;
  If (dbckAlertaResgate.Checked) then begin
    Label5.Visible := True;
    dbedMsgAlertaResgate.Visible := True;
  end else begin
    Label5.Visible := False;
    dbedMsgAlertaResgate.Visible := False;
    dbedMsgAlertaResgate.Text := '';
  end;
end;

procedure TfrmCadParamPessoa.dbckImpedePortabilidadeClick(Sender: TObject); // SOL 164235 Kintana 1409163 - Vinicius Ferreira
begin
  inherited;
  If (dbckImpedePortabilidade.Checked) then begin
    Label6.Visible := True;
    dbedMsgImpedePortabilidade.Visible := True;
  end else begin
    Label6.Visible := False;
    dbedMsgImpedePortabilidade.Visible := False;
    dbedMsgImpedePortabilidade.Text := '';
  end;
end;

end.


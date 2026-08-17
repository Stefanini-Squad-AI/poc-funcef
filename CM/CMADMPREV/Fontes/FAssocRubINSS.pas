unit FAssocRubINSS;

// Alterações:
{
--------------------------------------------------------------------------------
Pendência   : SOL 149652/3564 KINTANA 1107607
Responsável : TADEU PASSOS
Data        : 27/08/2012
Descrição   : Implementação de requerimento e concessão dos benefícios INSS em
              lote com base nas informações recebidas pelo arquivo de Reenbolso.
--------------------------------------------------------------------------------
Pendência   : SOL 146658/5341 KINTANA 1002387
Responsável : BRUNO AZEVEDO E VINI FERREIRA
Data        : 18/08/2011
Descrição   : Ajuste na associação de rubricas.
------------------------------------------------------------------------------
Pendência   : SOL 146658 KINTANA 1002387
Responsável : MARCIO DENILSON
Data        : 19/01/2011
Descrição   : Alteração da interface para contemplar as opções de flag para indicar
             rubrica central e do flag para constar no extrato.
------------------------------------------------------------------------------
Rotina    : pnlInforma
Data      : 11/05/2007
Autor     : Augusto
Pendência : 25321
Descrição : Acerto no posicionamento na tela
--------------------------------------------------------------------------------
Rotina    : bbtnConfirmarClick
Data      : 25/06/2006
Autor     : André Pontes
Pendência : 23035
Descrição : Gravação da flag FLGRATEIOPLANO, que indica que a rubrica pode sofrer
            rateio por plano quando for o caso
-------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, DBGrids, Db, DBTables, Wwquery, Wwdatsrc,
  Wwdbigrd, Wwdbgrid, MontaSelect, Menus, wwdblook;

type
  TFrmAssocRubINSS = class(TfrmSairAjuda)
    sbtnAssocia: TSpeedButton;
    sbtnAssociaTodos: TSpeedButton;
    sbtnDesassocia: TSpeedButton;
    sbtnDesassociaTodos: TSpeedButton;
    dsyRubAssoc: TwwDataSource;
    dsRubNaoAssoc: TwwDataSource;
    qryRubAssoc: TwwQuery;
    qryRubNaoAssoc: TwwQuery;
    qryAux: TwwQuery;
    dbgrdRubAssoc: TwwDBGrid;
    dbgrdRubNaoAssoc: TwwDBGrid;
    MSRubNaoAssoc: TMontaSelect;
    MSRubAssoc: TMontaSelect;
    pmCentraliza: TPopupMenu;
    Centralizadora1: TMenuItem;
    pnlInforma: TPanel;
    bbtnConfirmar: TBitBtn;
    bbtnCancelar: TBitBtn;
    qryAux2: TwwQuery;
    AssociaNovaRubricadoINSS1: TMenuItem;
    gboxTexto: TGroupBox;
    Label2: TLabel;
    edtRubINSS: TEdit;
    cboxRubCentral: TCheckBox;
    chkConstaExtrato: TCheckBox;
    Panel10: TPanel;
    BitBtn1: TBitBtn;
    Panel1: TPanel;
    chkRateioPlano: TCheckBox;
    bbtnProcurar: TBitBtn;
    bbtnConfirmaComit: TBitBtn;
    Label23: TLabel;
    cbdRubDesembINSS: TwwDBLookupCombo;
    qryRubDesembINSS: TwwQuery;
    cbdTipoRubricaINSS: TwwDBLookupCombo;
    Label1: TLabel;
    qryTipoRubricaINSS: TwwQuery;
    procedure sbtnDesassociaClick(Sender: TObject);
    procedure sbtnAssociaClick(Sender: TObject);
    procedure sbtnDesassociaTodosClick(Sender: TObject);
    procedure sbtnAssociaTodosClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnProcurarClick(Sender: TObject);
    procedure Centralizadora1Click(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure AssociaNovaRubricadoINSS1Click(Sender: TObject);
    procedure bbtnConfirmaComitClick(Sender: TObject);
  private
    { Private declarations }
    sRubricaINSS           : String;
    sOperacao              : Char;

    Procedure AtualizaQrys;
    Function ERubCentral(qry: TwwQuery): Boolean;
    Function ExisteAssocRubINSS(qryAux:TwwQuery; pRubricaINSS: String):Boolean;
    Function ExisteAssocRubINSSOutraRub(qryAux:TwwQuery; pRubricaINSS, pRubrica: String):Boolean;
    Function ValidaCodInternoeExternoRubricaCadastrado(qryAux:TwwQuery; pRubrica: String):Boolean;

  public
    { Public declarations }
  end;

var
  FrmAssocRubINSS: TFrmAssocRubINSS;

implementation

{$R *.DFM}

uses uMensErro, DBaseDados;

procedure TFrmAssocRubINSS.sbtnDesassociaClick(Sender: TObject);
begin
  inherited;
  // Excluir da tabela RUBRICAXINSS
  With QryAux Do
  Begin
    Sql.Clear;
    Sql.Add(' DELETE FROM RUBRICAXINSS '+
            ' WHERE IDRUBRICA = ' +qryRubAssoc.FieldByName('IDRUBRICA').AsString );
    try
      ExecSQL;
    Except
    End;
  End;

  // Atualizar as qrys
  AtualizaQrys;
end;

procedure TFrmAssocRubINSS.sbtnAssociaClick(Sender: TObject);
begin
  inherited;
  edtRubINSS.clear;
  sOperacao := 'I';

  // exibe tela para entrada do código corespondente ao do INSS
  sRubricaINSS := '';

  pnlInforma.Top := 150;
  pnlInforma.Left := 220;
  pnlInforma.Visible := True;

  //BRUNO AZEVEDO SOL 146658/5341 KINTANA 1002387
  edtRubINSS.Enabled := True;
  edtRubINSS.Text := qryRubNaoAssoc.FieldByName('CODPROVDESC').AsString;
  edtRubINSS.Enabled := False;
end;

procedure TFrmAssocRubINSS.sbtnDesassociaTodosClick(Sender: TObject);
begin
  inherited;
  If MsgDlg('Este processo excluirá todas as associações existentes.'+#13+
            'Confirma?','Confirmação',mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrNo Then
  Exit;

  // deletar tudo.
  With QryAux Do
  Begin
    Sql.Clear;
    Sql.Add(' DELETE FROM RUBRICAXINSS ');
    try
      ExecSQL;
    Except
    End;
  End;
  // Atualizar as qrys
  AtualizaQrys;
end;

procedure TFrmAssocRubINSS.sbtnAssociaTodosClick(Sender: TObject);
begin
  inherited;
  // efetuar loop das rubricas não associadas
  qryRubNaoAssoc.First;
  While Not qryRubNaoAssoc.Eof Do
  Begin
    sbtnAssocia.OnClick(Self);
  End;
end;

procedure TFrmAssocRubINSS.AtualizaQrys;
begin
  qryRubNaoAssoc.Close;
  qryRubAssoc.Close;
  qryRubNaoAssoc.Open;
  qryRubAssoc.Open;
end;

procedure TFrmAssocRubINSS.FormShow(Sender: TObject);
begin
  inherited;
  AtualizaQrys;
  pnlInforma.Visible := false;
  qryTipoRubricaINSS.Open; // TADEU PASSOS SOL 149652/3564 KINTANA 1107607
  qryRubDesembINSS.Open;
End;
procedure TFrmAssocRubINSS.bbtnProcurarClick(Sender: TObject);
begin
  inherited;
  MSRubNaoAssoc.Executar;
  If MSRubNaoAssoc.RetornouValor Then
  begin
    Repaint;
    Application.ProcessMessages;
    qryRubNaoAssoc.Locate('IDPROVENTO',MSRubNaoAssoc.ValoresChave[0],[]);
  end;
  Repaint;
  Application.ProcessMessages;
end;

procedure TFrmAssocRubINSS.Centralizadora1Click(Sender: TObject);
begin
  inherited;
  //  marca rubrica como centralizadora.
  sOperacao := 'A';
  gboxTexto.Caption := 'Alteração';
  edtRubINSS.Text := qryRubAssoc.FieldByname('RUBRICAINSS').AsString;
  cboxRubCentral.Checked := qryRubAssoc.FieldByname('FLGRUBCENTRAL').AsInteger = 1;

  //BRUNO AZEVEDO SOL 146658/5341 KINTANA 1002387
  if (Trim(qryRubAssoc.FieldByName('RUBRICAINSSDESEMB').AsString) <> '') then begin
    qryRubDesembINSS.Locate('CODPROVDESC', qryRubAssoc.FieldByName('RUBRICAINSSDESEMB').AsString, []);
    cbdRubDesembINSS.Text := qryRubDesembINSS.FieldByName('CODPROVDESC').AsString;

    if qryTipoRubricaINSS.Locate('FLGTIPORUBRICAXINSS',qryRubAssoc.FieldByName('FLGTIPORUBRICAXINSS').AsString,[]) then
      cbdTipoRubricaINSS.Text := qryTipoRubricaINSS.FieldByName('DESCRICAOTIPORUBRICAXINSS').AsString
    else
      cbdTipoRubricaINSS.Text := '';
  end else begin
    cbdRubDesembINSS.Text := '';
    cbdTipoRubricaINSS.Text := '';
  end;

  sRubricaINSS := '';

  pnlInforma.Top := 150;
  pnlInforma.Left := 220;
  pnlInforma.Visible := True;
end;



procedure TFrmAssocRubINSS.bbtnConfirmarClick(Sender: TObject);
var
   sRubCentral    : String;
   sConstaExtrato : String;
   sRateioPlano   : String;
begin
  inherited;

  sRubricaINSS := Trim(edtRubINSS.Text);
  If sRubricaINSS = '' Then
  Begin
    MsgDlg('Código da Rubrica do INSS não informado.','Informação',mtWarning,[mbOk],0);
    pnlInforma.Visible := False;
    Exit;
  End;

  //BRUNO AZEVEDO SOL 146658/5341 KINTANA 1002387
  If (Trim(cbdRubDesembINSS.Text) = '') Then
  Begin
    MsgDlg('É obrigatório selecionar a rubrica desembolso do INSS.','Informação',mtWarning,[mbOk],0);
    pnlInforma.Visible := False;
    Exit;
  End;

  If (sOperacao = 'I') and ExisteAssocRubINSS(qryAux,sRubricaINSS) Then
  Begin
    MsgDlg('Rubrica do INSS já cadastrada.','Informação',mtWarning,[mbOk],0);
    pnlInforma.Visible := False;
    Exit;
  End;

  If (sOperacao <> 'I') and ExisteAssocRubINSSOutraRub(qryAux,sRubricaINSS,qryRubNaoAssoc.FieldByName('IDPROVENTO').AsString) Then
  Begin
    MsgDlg('Rubrica do INSS já cadastrada.','Informação',mtWarning,[mbOk],0);
    pnlInforma.Visible := False;
    Exit;
  End;

  if not ValidaCodInternoeExternoRubricaCadastrado(qryAux,qryRubNaoAssoc.FieldByName('IDPROVENTO').AsString) Then
  Begin
    MsgDlg('Rubrica não possúi código interno ou externo cadastrado.','Informação',mtWarning,[mbOk],0);
    Exit;
  End;

  // TADEU PASSOS SOL 149652/3564 KINTANA 1107607
  If (Trim(cbdTipoRubricaINSS.Text) = '') Then
  Begin
    MsgDlg('É necessário selecionar o tipo de rubrica do INSS.','Informação',mtWarning,[mbOk],0);
    pnlInforma.Visible := False;
    Exit;
  End;
  // TADEU PASSOS SOL 149652/3564 KINTANA 1107607


  // Após informação incluir na tabela RUBRICAXINSS
  If cboxRubCentral.Checked Then
    sRubCentral := '1'
  Else sRubCentral := '0';

  If chkConstaExtrato.Checked Then
    sConstaExtrato := '1'
  Else sConstaExtrato := '0';

  if chkRateioPlano.Checked then
    sRateioPlano := '1'
  else sRateioPlano := '0';

  Case sOperacao Of
  'I': // Novo registro
    Begin
      If (Not ERubCentral(qryAux2)) Or (sRubCentral = '0') Then
      Begin
        With QryAux Do
        Begin
          Sql.Clear;
          Sql.Add(' INSERT INTO RUBRICAXINSS (IDRUBRICA, RUBRICAINSS, FLGRUBCENTRAL, FLGCONSTAEXTRATO, FLGRATEIOPLANO, RUBRICAINSSDESEMB, FLGTIPORUBRICAXINSS)' +
                  ' VALUES ( ' + qryRubNaoAssoc.FieldByName('IDPROVENTO').AsString +', '+
                    sRubricaINSS  + ', '+ sRubCentral + ',' + sConstaExtrato + ',' + sRateioPlano + ',' + cbdRubDesembINSS.Text + ',' +
                    (#39+qryTipoRubricaINSS.FieldByName('FLGTIPORUBRICAXINSS').AsString+#39) + ')' ); // TADEU PASSOS SOL 149652/3564 KINTANA 1107607, Obs: inserido o campo FLGTIPORUBRICAXINSS
          try
            ExecSQL;
          Except
          End;
        End;
      End;
    End;
  'A': // Alteraçào
    Begin
      With QryAux Do
      Begin
        Sql.Clear;
        Sql.Add(' UPDATE RUBRICAXINSS ' +
                ' SET FLGRUBCENTRAL    = ' + sRubCentral +
                ' ,   RUBRICAINSS      = ' + sRubricaINSS +
                ' ,   RUBRICAINSSDESEMB      = ' + cbdRubDesembINSS.Text +
                ' ,   FLGCONSTAEXTRATO = ' + sConstaExtrato +
                ' ,   FLGRATEIOPLANO   = ' + sRateioPlano +
                ' ,   FLGTIPORUBRICAXINSS = ' + #39+qryTipoRubricaINSS.FieldByName('FLGTIPORUBRICAXINSS').AsString+#39 + // TADEU PASSOS SOL 149652/3564 KINTANA 1107607, Obs: inserido o campo FLGTIPORUBRICAXINSS
                ' WHERE IDRUBRICA = ' + qryRubAssoc.FieldByName('IDRUBRICA').AsString );
        try
          ExecSQL;
        Except
        End;
      End;
    End;

  'N': // Nova rubrica no INSS associada à uma rubrica da fundaçào já cadastrada
    Begin
      // Verifica se a rubrica INSS já foi cadastrada para outra da fundação.
      If Not ExisteAssocRubINSS(qryAux,sRubricaINSS) Then
      Begin
        // Inclui novo registro com uma nova rubrica do INSS associada à uma rubrica
        // da fundação já cadastra.
        With QryAux Do
        Begin
          Sql.Clear;
          Sql.Add(' INSERT INTO RUBRICAXINSS (IDRUBRICA, RUBRICAINSS, FLGRUBCENTRAL, RUBRICAINSSDESEMB, FLGTIPORUBRICAXINSS) VALUES ( ' +
                    qryRubAssoc.FieldByName('IDRUBRICA').AsString +', '+
                    sRubricaINSS  + ', '+ sRubCentral + ',' + cbdRubDesembINSS.Text + ',' +
                    #39+qryTipoRubricaINSS.FieldByName('FLGTIPORUBRICAXINSS').AsString+#39  + ')' ); // TADEU PASSOS SOL 149652/3564 KINTANA 1107607, Obs: inserido o campo FLGTIPORUBRICAXINSS
          try
            ExecSQL;
          Except
          End;
        End;
      End Else
      Begin
        // Não permitir cadastro de rubrica duplicada.
        ShowMessage('Rubrica do INSS já associada!');
      End;

    End;

  End;// Case

  cboxRubCentral.Checked := False;
  pnlInforma.Visible := False;
  // Atualizar as qrys.
  AtualizaQrys;
end;



procedure TFrmAssocRubINSS.BitBtn1Click(Sender: TObject);
begin
  inherited;
  MSRubAssoc.Executar;
  If MSRubAssoc.RetornouValor Then
  begin
    Repaint;
    Application.ProcessMessages;
    qryRubAssoc.Locate('CODPROVDESC',MSRubAssoc.ValoresChave[0],[]);
  end;
   Repaint;
   Application.ProcessMessages;
end;

procedure TFrmAssocRubINSS.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  cboxRubCentral.Checked := False;
  pnlInforma.Visible := False;
end;

function TFrmAssocRubINSS.ERubCentral(qry: TwwQuery): Boolean;
begin
  //
  qry.Sql.Clear;
  qry.Sql.Add(' SELECT 1 FROM RUBRICAXINSS '+
              ' WHERE RUBRICAINSS = ' + Trim(edtRubINSS.Text) +
              '   AND FLGRUBCENTRAL = 1 ');
  qry.Open;
  Result := Not qry.IsEmpty;
end;

procedure TFrmAssocRubINSS.AssociaNovaRubricadoINSS1Click(Sender: TObject);
begin
  inherited;

  gboxTexto.Caption := 'Inclusão';


  //  marca rubrica como centralizadora.
  sOperacao := 'N';
  edtRubINSS.Text := '';
  cboxRubCentral.Checked := qryRubAssoc.FieldByname('FLGRUBCENTRAL').AsInteger = 1;

  sRubricaINSS := '';

  pnlInforma.Top := 150;
  pnlInforma.Left := 220;
  pnlInforma.Visible := True;
end;



function TFrmAssocRubINSS.ExisteAssocRubINSS(qryAux:TwwQuery;
  pRubricaINSS: String): Boolean;
begin
  // Verifica se existe rubrica do INSS associada à uma outra da fundação.
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' SELECT * FROM RUBRICAXINSS ' +
                 ' WHERE RUBRICAINSS =  '+ QuotedStr(pRubricaINSS));
  qryAux.Open;
  Result := Not qryAux.IsEmpty;
  qryAux.Close;
end;



function TFrmAssocRubINSS.ExisteAssocRubINSSOutraRub(qryAux: TwwQuery;  pRubricaINSS, pRubrica: String): Boolean;
begin
  // Verifica se existe rubrica do INSS associada à uma outra da fundação.
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' SELECT * FROM RUBRICAXINSS ' +
                 ' WHERE RUBRICAINSS =  '+ QuotedStr(pRubricaINSS) +
                 '   AND IDRUBRICA <>  '+ QuotedStr(pRubrica) );
  qryAux.Open;
  Result := Not qryAux.IsEmpty;
  qryAux.Close;

end;

function TFrmAssocRubINSS.ValidaCodInternoeExternoRubricaCadastrado(
  qryAux: TwwQuery; pRubrica: String): Boolean;
begin

  // Verifica se existe rubrica possui códigos internos e externos cadastrados.
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' SELECT *                                 ');
  qryAux.Sql.Add(' FROM PROVDESC                            ');
  qryAux.Sql.Add(' WHERE IDPROVENTO = '+ QuotedStr(pRubrica) );
  qryAux.Sql.Add('   AND IDPROVENTO IS NOT NULL             ');
  qryAux.Sql.Add('   AND CODPROVDESC IS NOT NULL            ');
  qryAux.Open;
  Result := Not qryAux.IsEmpty;
  qryAux.Close;

end;

procedure TFrmAssocRubINSS.bbtnConfirmaComitClick(Sender: TObject);
begin
  inherited;
   if dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.Commit;
end;

end.

// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************

//------------------------------------------------------------------------------
// Alteracoes : (dfm upd) CmeCadastroFind, CmeCadastroInsert, qryBeforePost
// Autor(a)   : Edilaine
// Data       : 18/05/2026
// SIG        : 38808
// Descricao  : Inclusao campo TIPOPORTABILIDADE
//------------------------------------------------------------------------------
// Alteracoes : (dfm) dblckTpContrib, cbAltSituacao, qryBeforePost, upd, qry,
//              CmeCadastroFind 
// Autor(a)   : Edilaine Ferraresi
// Data       : 29/12/2016
// SIG        : 36752
// Descricao  : Equacionamento - inclusao do tipo de contribuição no cadastro
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 16.06.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
unit FCadContribuicaoCS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, StdCtrls, ExtCtrls, DBCtrls, Mask, wwdbedit,
  CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect, DBTables,
  IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, Buttons, TB97Tlbr,
  TB97Ctls, TB97, wwdblook;

type
  TfrmCadContribuicaoCS = class(TfrmCadastroCS)
    dsTpPer: TwwDataSource;
    qryTpPer: TwwQuery;
    lbPeriodicidade: TLabel;
    lbqtdeParcelas: TLabel;
    Label1: TLabel;
    dbedQtdParcela: TwwDBEdit;
    dbedNomeContrib: TwwDBEdit;
    chkTmpContrib: TCheckBox;
    dbrgrpFormaCont: TDBRadioGroup;
    dblkcmbPeriodicidade: TwwDBLookupCombo;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    dbedNomeResum: TwwDBEdit;
    dbrgrpRisco: TDBRadioGroup;
    Label4: TLabel;
    dblckTpContrib: TwwDBLookupCombo;
    cbAltSituacao: TCheckBox;
    qryTpContrib: TwwQuery;
    dbrgTipoPortab: TDBRadioGroup;
    chkTipoPortab: TCheckBox;
    procedure chkTmpContribClick(Sender: TObject);
    procedure dbrgrpFormaContChange(Sender: TObject);
    procedure dbedQtdParcelaEnter(Sender: TObject);

    procedure chkTmpContribEnter(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    procedure qryBeforePost(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbedQtdParcelaKeyPress(Sender: TObject; var Key: Char);
    procedure chkTipoPortabClick(Sender: TObject);
  private
    { Private declarations }
    vTmpContribCheched : Boolean;
    procedure ArrumaTObrigatoria;
    procedure ArrumaTFacultativa;

  public
    { Public declarations }
  end;

var
  frmCadContribuicaoCS: TfrmCadContribuicaoCS;

implementation

uses UDataBase, UMensErro, Usistema, UAdmPrev;

{$R *.DFM}

procedure TfrmCadContribuicaoCS.CmeCadastroFind(Sender: TObject);
begin
  inherited;

  if MontaSelect.RetornouValor
  then begin
     qry.Close;
     qry.ParamByName('IDCONTRIBUICAO').AsInteger := StrToInt(MontaSelect.ValoresChave[0]);
     qry.Open;

     if qry.fieldbyname('FlgObrigatoria').AsString = 'E'
     then ArrumaTFacultativa
     else ArrumaTObrigatoria;

     cbAltSituacao.checked := (qry.FieldbyName('FLGALTERASITRECEB').AsInteger = 1);   //edilaine - SIG36752

     //edilaine WO38808 : inicio
     chkTipoPortab.checked := (qry.FieldByName('TIPOPORTABILIDADE').AsString <> '');
     //edilaine WO38808 : fim
  end;
end;

procedure TfrmCadContribuicaoCS.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  dbedNomeContrib.SetFocus;
  dbrgrpRisco.ItemIndex := 0;
  cbAltSituacao.checked := false;    //edilaine - SIG36752

  chkTipoPortab.checked := false;    //edilaine WO38808
  dblckTpContrib.text   := '';       //edilaine WO38808

  qry.FieldByName('IDCONTRIBUICAO').AsInteger := LeUltRegistro(nil, 'CONTRIBUICAO');   //edilaine - SIG36752
end;

procedure TfrmCadContribuicaoCS.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  dbedNomeContrib.SetFocus;
end;



procedure TfrmCadContribuicaoCS.ArrumaTFacultativa;
begin
     lbPeriodicidade.Visible      := False;
     dblkcmbPeriodicidade.Visible := False;
     chkTmpContrib.Visible        := False;
     lbQtdeParcelas.Visible       := False;
     dbedQtdParcela.Visible       := False;
     dblkcmbPeriodicidade.Text    := '';
     qryTpPer.close;
     qryTpPer.Open;

     //edilaine - SIG36752 - inicio
     qryTpContrib.close;
     qryTpContrib.open;
     //edilaine - SIG36752 - fim

     chkTmpContrib.Checked        := False;
     dbedQtdParcela.Text          := '';
end;

procedure TfrmCadContribuicaoCS.ArrumaTObrigatoria;
begin
  lbPeriodicidade.Visible      := True;
  dblkcmbPeriodicidade.Visible := True;
  chkTmpContrib.Visible        := True;
  lbQtdeParcelas.Visible       := True;
  dbedQtdParcela.Visible       := True;
  vTmpContribCheched           := qry.FieldByName('QTDEPARCELAS').AsInteger <> 0;
  chkTmpContrib.Checked        := qry.FieldByName('QTDEPARCELAS').AsInteger <> 0;
  if not chkTmpContrib.Checked then
  begin
     lbQtdeParcelas.Visible       := False;
     dbedQtdParcela.Visible       := False;
  end;
end;

procedure TfrmCadContribuicaoCS.chkTmpContribClick(Sender: TObject);
begin
  inherited;
  if not (ds.DataSet.State in [dsEdit,dsInsert]) then
     chkTmpContrib.Checked := vTmpContribCheched
  else begin
     lbQtdeParcelas.Visible := chkTmpContrib.Checked;
     dbedQtdParcela.Visible := chkTmpContrib.Checked;
  end;

end;

procedure TfrmCadContribuicaoCS.dbrgrpFormaContChange(Sender: TObject);
begin
  inherited;
  case dbrgrpFormaCont.ItemIndex of
      -1 :  ArrumaTFacultativa;
       0 :  ArrumaTObrigatoria;
       1 :  ArrumaTObrigatoria;
       2 :  ArrumaTFacultativa;
  end;

end;

procedure TfrmCadContribuicaoCS.dbedQtdParcelaEnter(Sender: TObject);
begin
  inherited;
  lbQtdeParcelas.Visible := chkTmpContrib.Checked;
  dbedQtdParcela.Visible := chkTmpContrib.Checked;

end;

procedure TfrmCadContribuicaoCS.chkTmpContribEnter(Sender: TObject);
begin
  inherited;
  if not (ds.DataSet.State in [dsEdit,dsInsert]) then
    vTmpContribCheched := chkTmpContrib.Checked
end;


procedure TfrmCadContribuicaoCS.qryBeforePost(DataSet: TDataSet);
begin
  inherited;
  if dbedNomeContrib.Text = '' then
  begin
    MsgDlg('Descrição da Contribuição não preenchido.','Aviso',mtInformation,[mbOk,mbHelp],0);
    Abort;
  end;


  if dbrgrpFormaCont.ItemIndex = -1 then
  begin
    MsgDlg('Forma da Contribuição não selecionado.','Aviso',mtInformation,[mbOk,mbHelp],0);
    Abort;
  end;

  if (dbrgrpFormaCont.ItemIndex <> 2) and (dblkcmbPeriodicidade.Text = '') then
  begin
    MsgDlg('Periodicidade não preenchida.','Aviso',mtInformation,[mbOk,mbHelp],0);
    Abort;
  end;

  if (dbrgrpFormaCont.ItemIndex <> 2) and (chkTmpContrib.Checked) and
     (dbedQtdParcela.Text = '') then
  begin
    MsgDlg('Quantidade de Parcelas não preenchida.','Aviso',mtInformation,[mbOk,mbHelp],0);
    Abort;
  end;

  
  if dbrgrpFormaCont.ItemIndex = 2
  then begin
     qry.FieldbyName('IDTPPERIODICIDADE').Clear;
     qry.FieldbyName('QTDEPARCELAS').Clear;
  end;

  if (dbrgrpFormaCont.ItemIndex <> 2) and (not chkTmpContrib.checked)
  then
     qry.Fieldbyname('QTDEPARCELAS').Clear;

  if dblkcmbPeriodicidade.Text = '' then
     qry.FieldByName('IDTPPERIODICIDADE').Clear;

  //edilaine - SIG36752 - inicio
  if cbAltSituacao.checked then
     qry.FieldbyName('FLGALTERASITRECEB').AsInteger := 1
  else
     qry.FieldbyName('FLGALTERASITRECEB').AsInteger := 0;

  {if qry.State = dsInsert
  then begin
     try
       qry.FieldByName('IDCONTRIBUICAO').AsInteger := LeUltRegistro(nil,'CONTRIBUICAO');
     except
       ShowMessage('Erro na geração do código');
     end;
  end;}
  //edilaine - SIG36752 - fim

  //edilaine WO38808 : inicio
  if (chkTipoPortab.checked) and (dbrgTipoPortab.ItemIndex = -1) then
  begin
    MsgDlg('Tipo de Portabilidade não selecionado.','Aviso',mtInformation,[mbOk,mbHelp],0);
    Abort;
  end;

  if (not chkTipoPortab.checked) then
     qry.FieldbyName('TIPOPORTABILIDADE').Clear;
  //edilaine WO38808 : fim

end;

procedure TfrmCadContribuicaoCS.FormActivate(Sender: TObject);
begin
  inherited;
  qryTpPer.close;
  qryTpPer.Open;

  //edilaine - SIG36752 - inicio
  qryTpContrib.close;
  qryTpContrib.open;
  //edilaine - SIG36752 - fim

end;

procedure TfrmCadContribuicaoCS.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
    
    Try
      If Not Sistema.GravaLogOperacoes(Self.Caption) Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;

end;

procedure TfrmCadContribuicaoCS.FormShow(Sender: TObject);
begin
  inherited;
  MontaSelect.Filtro.Add(' CONTRIBUICAO.IDCONTRIBUICAO IN (SELECT CP.IDCONTRIBUICAO FROM PLANPREVPATRO PLP, PATRO P, CONTPREV CP '+ // CAMILLE - 10.06.2003
                         '                          WHERE   P.IDFUNDACAO = '+IntToStr(iIdFundacao)           +
                         '                          AND     PLP.IDPESSJUR = P.IDPESSOA                      '+
                         '                          AND     CP.IDPLANOPREV = PLP.IDPLANOPREV) OR            '+
                         ' NOT EXISTS (SELECT 1 FROM CONTPREV CP WHERE CP.IDCONTRIBUICAO = CONTRIBUICAO.IDCONTRIBUICAO) ');

end;

procedure TfrmCadContribuicaoCS.dbedQtdParcelaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (Key in ['0'..'9', #8]) then
     key := #0;
end;


procedure TfrmCadContribuicaoCS.chkTipoPortabClick(Sender: TObject);
begin
  inherited;
  dbrgTipoPortab.enabled := chkTipoPortab.checked;
end;


end.

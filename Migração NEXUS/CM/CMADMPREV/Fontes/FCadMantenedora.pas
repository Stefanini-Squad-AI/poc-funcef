// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//  Autor      : Augusto
//  Data       : 29/09/2005
//  Pendencia  : 19328
//  Descrição  : Esconder Modelos de LayOut
//------------------------------------------------------------------------------
//  Autor      : Augusto
//  Data       : 21/02/2005
//  Descrição  : Incluir Tipo de Recebimento/Desembolso
//------------------------------------------------------------------------------
//  Autor      : Camille
//  Rotina     : qryPlano
//  Data       : 20.10.2004
//  Pendencia  : 17578
//  Descrição  : Filtrar planos ativos
//------------------------------------------------------------------------------
unit FCadMantenedora;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, Mask, wwdbedit, DBCtrls, CmEventosCadastro, ImgList, DBCGrids,
  ppComm, ppEndUsr, ppCtrls, ppPrnabl, ppClass, ppBands, ppCache, ppRelatv,
  ppProd, ppReport, FPreview, Pptypes, ppDB, ppDBPipe, ppDBBDE, ppVar,
  wwdblook, ComCtrls, CMTree;

type
  TfrmCadMantenedora = class(TfrmCadastroCS)
    dbedtMantenedora: TwwDBEdit;
    lblDescMant: TLabel;
    qryCODMANTENEDORA: TStringField;
    qryNOME: TStringField;
    dbedtCodigo: TwwDBEdit;
    lblCodigo: TLabel;
    qryFLGFUNDACAO: TFloatField;
    DBCheckBox1: TDBCheckBox;
    qryAux: TwwQuery;
    rgrpLayout: TDBRadioGroup;
    qryNUMLAYOUT: TFloatField;
    DsgnCM: TppDesigner;
    rpModelo1: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLine1: TppLine;
    rpCartaInadimplDBImage1: TppDBImage;
    rpCartaInadimplLabel1: TppLabel;
    rpCartaInadimplDBText1: TppDBText;
    rpCartaInadimplDBText2: TppDBText;
    rpCartaInadimplDBText3: TppDBText;
    rpCartaInadimplDBText4: TppDBText;
    rpCartaInadimplDBText5: TppDBText;
    rpCartaInadimplDBText6: TppDBText;
    rpCartaInadimplDBText7: TppDBText;
    rpCartaInadimplDBText8: TppDBText;
    qryFundacao: TwwQuery;
    dsFundacao: TwwDataSource;
    ppFundacao: TppBDEPipeline;
    ppFundacaoppField1: TppField;
    ppFundacaoppField2: TppField;
    ppFundacaoppField3: TppField;
    ppFundacaoppField4: TppField;
    ppFundacaoppField5: TppField;
    ppFundacaoppField6: TppField;
    ppFundacaoppField7: TppField;
    ppFundacaoppField8: TppField;
    ppFundacaoppField9: TppField;
    ppFundacaoppField10: TppField;
    ppLine57: TppLine;
    ppLabel165: TppLabel;
    ppCalc48: TppSystemVariable;
    ppCalc49: TppSystemVariable;
    rpModelo2: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel3: TppLabel;
    ppLine2: TppLine;
    ppDBImage1: TppDBImage;
    ppLabel4: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDetailBand2: TppDetailBand;
    ppLabel5: TppLabel;
    ppFooterBand2: TppFooterBand;
    ppLine3: TppLine;
    ppLabel6: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    cmbSubConta: TwwDBLookupCombo;
    qrySubConta: TwwQuery;
    qryPlano: TwwQuery;
    cmbPlano: TwwDBLookupCombo;
    Label1: TLabel;
    Label2: TLabel;
    qryCODSUBCONTA: TFloatField;
    qryIDEMPRESAPROP: TFloatField;
    qryIDPLANOPREV: TFloatField;
    SpeedButton1: TSpeedButton;
    Label33: TLabel;
    EdTipoDesembCR: TEdit;
    sbtnCODTIPDESEMBPROV: TSpeedButton;
    Label32: TLabel;
    EdTipoDesembCP: TEdit;
    dsTpReceb: TwwDataSource;
    QryTpReceb: TwwQuery;
    QryTpRecebCODTIPRECDES: TStringField;
    QryTpRecebDESCRICAO: TStringField;
    QryTpRecebANASINT: TStringField;
    dsTpPaga: TwwDataSource;
    QryTpPaga: TwwQuery;
    QryTpPagaCODTIPRECDES: TStringField;
    QryTpPagaDESCRICAO: TStringField;
    QryTpPagaANASINT: TStringField;
    treeTpReceb: TCMTreeView;
    treeTpPaga: TCMTreeView;
    qryCODTIPREC: TStringField;
    qryCODTIPDES: TStringField;
    btnImprimir1: TBitBtn;
    btnImprimir2: TBitBtn;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    procedure rgrpLayoutClick(Sender: TObject);
    procedure btnImprimir1Click(Sender: TObject);
    procedure btnImprimir2Click(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cmbSubContaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
    procedure sbtnCODTIPDESEMBPROVClick(Sender: TObject);
    procedure treeTpPagaDblClick(Sender: TObject);
    procedure treeTpPagaExit(Sender: TObject);
    procedure treeTpRecebDblClick(Sender: TObject);
    procedure treeTpRecebExit(Sender: TObject);
  private
    { Private declarations }
    Procedure AbreArvoreTipoRecebimento( iControle, iTop, iLeft : integer );
    Procedure AbreArvoreTipoDesembolso ( iControle, iTop, iLeft : integer );
  public
    { Public declarations }
  end;

var
  frmCadMantenedora: TfrmCadMantenedora;

implementation

{$R *.DFM}

uses UDataBase, UMensErro, USistema, uAdmPrev, UIntegraBack, DIntegraCAPCAR;

procedure TfrmCadMantenedora.CmeCadastroInsert(Sender: TObject);
begin
   Inherited;

   dbedtCodigo.SetFocus;
end;

procedure  TfrmCadMantenedora.CmeCadastroFind(Sender: TObject);
begin
  Inherited;
  If MontaSelect.RetornouValor then begin
     qry.Close;
     qry.ParamByName('CODMANTENEDORA').AsInteger := StrToInt(MontaSelect.ValoresChave[0]);
     qry.Open;

     btnImprimir1.Enabled := qry.FieldByName('NUMLAYOUT').AsInteger = 1;
     btnImprimir2.Enabled := qry.FieldByName('NUMLAYOUT').AsInteger = 2;

     { Descrições dos tipos de recebimento/desenbolso }
     QryAux.Close;
     QryAux.SQL.Clear;
     QryAux.SQL.Add('SELECT DESCRICAO FROM TIPORECEBDESEMB '+
                    'WHERE  RECPAG = ''R'' AND CODTIPRECDES = '+QuotedStr(qry.FieldByName('CODTIPREC').AsString));
     QryAux.Open;
     EdTipoDesembCR.Text := QryAux.FieldByName('DESCRICAO').AsString;

     QryAux.Close;
     QryAux.SQL.Clear;
     QryAux.SQL.Add('SELECT DESCRICAO FROM TIPORECEBDESEMB '+
                    'WHERE  RECPAG = ''P'' AND CODTIPRECDES = '+QuotedStr(qry.FieldByName('CODTIPDES').AsString));
     QryAux.Open;
     EdTipoDesembCP.Text := QryAux.FieldByName('DESCRICAO').AsString;
   end;


end;

procedure TfrmCadMantenedora.bbtnConfirmarClick(Sender: TObject);
begin
  // Critica Dados
  If (dbedtCodigo.Text   = '') Then Begin
    ShowMessage('Faltam Preencher Campos ...');
    dbedtCodigo.SetFocus;
    Exit;
  End;
  
  // Verifica Se Código já Cadastrado  
  If (sbtnInserir.Down)  And
     ( FazQuery(QryAux,' SELECT CODMANTENEDORA FROM CM.MANTENEDORA '+
                       ' WHERE RTRIM(CODMANTENEDORA) = '+ QuotedStr(dbedtCodigo.Text)))
    Then  Begin
      MsgDlg('Código já Cadastrado. ','Erro ',mtError,[mbOk],0);
      Exit;
    End;

  If DBCheckBox1.Checked = True Then Begin
     If FazQuery(QryAux,' SELECT CODMANTENEDORA FROM CM.MANTENEDORA '+
                        ' WHERE FLGFUNDACAO = 1')
     Then  Begin
       MsgDlg('Não pode ser a própria Fundação. ','Erro ',mtError,[mbOk],0);
       Exit;
     End;
  End;

    Try
      If Not Sistema.GravaLogOperacoes(Self.Caption) Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;

  inherited;
end;

procedure TfrmCadMantenedora.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  qry.FieldByName('FLGFUNDACAO').AsInteger := 0;
  dbedtCodigo.SetFocus;
end;

procedure TfrmCadMantenedora.FormShow(Sender: TObject);
begin
  inherited;
  qry.Open;

  Try
     qrytpreceb.close;
     qryTpReceb.ParamByName('IDEMPRESA').AsString := inttostr(Sistema.idEmpresa);
     qryTpReceb.Open;
     if not qryTpReceb.IsEmpty then begin
        treeTpReceb.Mascara := IntegraBack.MascaraDesemb;
        treeTpReceb.MontaArvore;
     end;
  Except
     raise;
  End;

  Try
    qrytpPaga.close;
    qryTpPaga.ParamByName('IDEMPRESA').AsString := IntToStr(Sistema.idEmpresa);
    qryTpPaga.Open;
    if not qryTpPaga.IsEmpty then begin
      treeTpPaga.Mascara := IntegraBack.MascaraDesemb;
      treeTpPaga.MontaArvore;
    end;
  Except
    raise;
  End;

end;

procedure TfrmCadMantenedora.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qry.close;
end;

procedure TfrmCadMantenedora.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  dbedtCodigo.Enabled := False;
end;

procedure TfrmCadMantenedora.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  dbedtCodigo.Enabled := True;
end;

procedure TfrmCadMantenedora.rgrpLayoutClick(Sender: TObject);
begin
  inherited;
   btnImprimir1.Enabled := rgrpLayout.ItemIndex = 0;
   btnImprimir2.Enabled := rgrpLayout.ItemIndex = 1;
end;

procedure TfrmCadMantenedora.btnImprimir1Click(Sender: TObject);
begin
  inherited;
  // Modelo 1
  qryFundacao.Close;
  qryFundacao.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao;
  qryFundacao.Open;
  //
  DsgnCM.Report                   := rpModelo1;
  DsgnCM.Report.Template.SaveTo   := stFile;
  DsgnCM.Report.Template.Format   := ftASCII;
  DsgnCM.Report.Device            := dvScreen;
  TFrmPreview.CreateModalPreview(Application, DsgnCM.Report, 'Modelo 1 de Layout para Importação de Arquivo');
end;

procedure TfrmCadMantenedora.btnImprimir2Click(Sender: TObject);
begin
  inherited;
  // Modelo 2
  qryFundacao.Close;
  qryFundacao.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao;
  qryFundacao.Open;
  //
  DsgnCM.Report                   := rpModelo2;
  DsgnCM.Report.Template.SaveTo   := stFile;
  DsgnCM.Report.Template.Format   := ftASCII;
  DsgnCM.Report.Device            := dvScreen;
  TFrmPreview.CreateModalPreview(Application, DsgnCM.Report, 'Modelo 2 de Layout para Importação de Arquivo');
end;

procedure TfrmCadMantenedora.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
   // Atualiza os botões quando cancela.
   btnImprimir1.Enabled := rgrpLayout.ItemIndex = 0;
   btnImprimir2.Enabled := rgrpLayout.ItemIndex = 1;
end;

procedure TfrmCadMantenedora.FormCreate(Sender: TObject);
begin
  inherited;

  // filtra a empresa proprietária.
  qrySubConta.Close;
  qrySubConta.Params[0].AsInteger := Sistema.IdEmpresa;
  qrySubConta.Open;

  qryPlano.Open;
end;

procedure TfrmCadMantenedora.cmbSubContaCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  // atribui o idempresaprop
  qry.FieldByName('IDEMPRESAPROP').AsInteger :=
    qrySubConta.FieldByName('IDPESSOA').AsInteger;
end;

procedure TfrmCadMantenedora.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  AbreArvoreTipoRecebimento(2, 245, 40);
end;

procedure TfrmCadMantenedora.sbtnCODTIPDESEMBPROVClick(Sender: TObject);
begin
  inherited;
  AbreArvoreTipoDesembolso(2, 282, 40);
end;

procedure TfrmCadMantenedora.AbreArvoreTipoDesembolso(iControle, iTop,
  iLeft: integer);
begin
  treeTpPaga.Tag     := iControle;
  treeTpPaga.Left    := iLeft;
  treeTpPaga.Top     := iTop;
  treeTpPaga.Visible := not treeTpPaga.Visible;
  if treeTpPaga.Visible then
     treeTpPaga.SetFocus;
end;

procedure TfrmCadMantenedora.AbreArvoreTipoRecebimento(iControle, iTop,
  iLeft: integer);
begin
  treeTpReceb.Tag     := iControle;
  treeTpReceb.Left    := iLeft;
  treeTpReceb.Top     := iTop;
  treeTpReceb.Visible := not treeTpReceb.Visible;
  if treeTpReceb.Visible then
     treeTpReceb.SetFocus;
end;

procedure TfrmCadMantenedora.treeTpPagaDblClick(Sender: TObject);
begin
  inherited;
  with dtmIntegraCAPCAR do
  begin
    if (qryTpPaga.FieldByName('ANASINT').AsString = 'A') then
         treeTpPagaExit(treeTpReceb)
    else Exit;
  end;
end;

procedure TfrmCadMantenedora.treeTpPagaExit(Sender: TObject);
begin
  inherited;
  if (qryTpPaga.FieldByName('ANASINT').AsString = 'A') then begin
    EdTipoDesembCP.Text := qryTpPaga.FieldByName('DESCRICAO').asString;
    qry.FieldByName('CODTIPDES').AsString := QryTpPaga.FieldByName('CODTIPRECDES').AsString;
  end;
  TreeTpPaga.Visible  := false;
end;

procedure TfrmCadMantenedora.treeTpRecebDblClick(Sender: TObject);
begin
  inherited;
  with dtmIntegraCAPCAR do
  begin
    if (qryTpReceb.FieldByName('ANASINT').AsString = 'A') then
         treeTpRecebExit(treeTpReceb)
    else Exit;
  end;
end;

procedure TfrmCadMantenedora.treeTpRecebExit(Sender: TObject);
begin
  inherited;
  if (qryTpReceb.FieldByName('ANASINT').AsString = 'A') then begin
    EdTipoDesembCR.Text := qryTpReceb.FieldByName('DESCRICAO').asString;
    qry.FieldByName('CODTIPREC').AsString := qryTpReceb.FieldByName('CODTIPRECDES').AsString;
  end;
  TreeTpReceb.Visible := false;
end;



end.
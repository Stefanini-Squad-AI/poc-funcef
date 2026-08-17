{############################    ALTERAÇÕES  ###################################
//***************************************************************************************
//Rotina             : AjustarModulo
//N. SIG..........   : 103856
//Data da Alteração: : 30/06/2021
//Alteração Form:    : fCadTipoCustoRecMT
//Responsável:       : Cássio Rovaroto
//Descrição.......   : Inclusão de campo para controle de receita/despesa somente para contrato.
//***************************************************************************************
//Rotina             : DBrdgCustoRecClick, FormCreate, AjustarModulo, CmeCadastroEdit
//N. SIG..........   : 115585
//Data da Alteração: : 18/05/2021
//Alteração Form:    : fCadTipoCustoRecMT
//Responsável:       : Cássio Rovaroto
//Descrição.......   : Retirada do campo FLGMAODEOBRA, para a definição de cessão de mão de obra.
//***************************************************************************************
//Rotina             : DBrdgCustoRecClick, FormCreate, AjustarModulo, CmeCadastroEdit
//N. SIG..........   : 23656.59194
//Data da Alteração: : 27/11/2017
//Alteração Form:    : fCadTipoCustoRecMT
//Responsável:       : Cássio Rovaroto
//Descrição.......   : Inclusão do campo FLGMAODEOBRA na tabela TIPOCUSTORECIMOV, a fim
//										           de possibilitar a definição de cessão de mão de obra.
//***************************************************************************************
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
Rotina.............: dblcOperContabExit
N. Sol.............: 144413
N. Kintana.........: 952733
Data...............: 28/09/2010
Responsável........: Felipe de Oliveira
Descrição..........: Modificação realizada para poder deletar o campo de
                     segunda operação contábil
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
}
unit fCadTipoCustoRecMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMTImob, wwdblook, StdCtrls, ExtCtrls, DBCtrls, Mask,
  DBCtrls2, MontaSelect, Db, DBClient, uCMClientDataSet, CmEventosCadastro,
  ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
  TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, DBTables, Wwquery,
  Provider, dBaseDados, uSistema, uMensErro, uMidasUtil, uCtrlTipoCustoRecImov,
  uCtrlTipodocRecPag, uComunsImobiliario, uVerificaPreenchimento, uModuloImobiliario,
  uCmSqlParams;

type
  TfrmCadTipoCustoRecMT = class(TfrmCadastroGridMTImob)
    lblDescricao: TLabel;
    DBedtDescricao: TDBEdit2;
    DBrdgCustoRec: TDBRadioGroup;
    Label2: TLabel;
    DBcboTipoDoc: TwwDBLookupCombo;
    panCAF: TPanel;
    Label13: TLabel;
    Label8: TLabel;
    CdsTipoDocumento: TCMClientDataSet;
    CdsTipoDespesa: TCMClientDataSet;
    CdsTipoDespesaIDTIPODESPESA: TFloatField;
    CdsTipoDespesaDESTIPODESPESA: TStringField;
    CdsTipoDocumentoCODTIPDOC: TFloatField;
    CdsTipoDocumentoDESCRICAO: TStringField;
    CdsTipoDocumentoDEBCRE: TStringField;
    CdsTipoDocumentoFLGENGLOBAPARCELA: TStringField;
    CdsTipoDocumentoFLGGERANUMDOC: TStringField;
    CdsTipoDocumentoFLGDOCFISCAL: TStringField;
    wwDBLookupCombo1: TwwDBLookupCombo;
    panDiario: TPanel;
    dbrgDiario: TDBRadioGroup;
    wwQuery1: TwwQuery;
    DataSetProvider1: TDataSetProvider;
    Label1: TLabel;
    lblOperContab: TLabel;
    cdsTipoOperacao: TCMClientDataSet;
    dblcOperContab: TwwDBLookupCombo;
    cdsTipoOperacaoIDTIPOCUSTORECIMO: TFloatField;
    cdsTipoOperacaoDESCCUSTORECIMO: TStringField;
    dbFlgRentab: TDBCheckBox;
    SqlTipoDespesa: TCMSqlParams;
    DBrdgTipoOper: TDBRadioGroup;
    dbchkBloqJudicial: TDBCheckBox;
    chkFLGRECCUSTCONTRATO: TDBCheckBox;
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure DBrdgCustoRecClick(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure dbGrdTitleButtonClick(Sender: TObject; AFieldName: String);
    procedure dblcOperContabExit(Sender: TObject);

  protected
    procedure FazerRefresh; override;

  private
    { Private declarations }
    CtrlTipoCustoRecImov : TCtrlTipoCustoRecImov;
    CtrlTipodocRecPag    : TCtrlTipodocrecpag;

    procedure AjustarModulo;
  public
    { Public declarations }
  end;

var
  frmCadTipoCustoRecMT: TfrmCadTipoCustoRecMT;

implementation

{$R *.DFM}

{ TfrmCadTipoCustoRecMT }

procedure TfrmCadTipoCustoRecMT.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlTipoCustoRecImov := TCtrlTipoCustoRecImov.Create;
  CtrlTipoCustoRecImov.Initialize (dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                                   Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                                   ComunsImobiliario.MensErroMT);
  CtrlTipoCustoRecImov.CdsTipoCustoRecImov := Cds;

  CtrlTipodocRecPag := TCtrlTipodocrecpag.Create;
  CtrlTipodocRecPag.InitializeAs(CtrlTipoCustoRecImov);

  cdsTipoOperacao.Data := CtrlTipoCustoRecImov.LookupTipoCustoRecImov(Sistema.IdModulo, 'O');

  SqlTipoDespesa.Open;

  AjustarModulo;
  FazerRefresh;
end;

procedure TfrmCadTipoCustoRecMT.FazerRefresh;
begin
  inherited;
  Cds.Data := CtrlTipoCustoRecImov.LookupTipoCustoRecImov(Sistema.IdModulo);
  Repaint;
end;

procedure TfrmCadTipoCustoRecMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Cds.FieldByName('IDMODULO').AsInteger := Sistema.IdModulo;
  if Cds.FieldByName('RECCUSTO').AsString = 'R' then Cds.FieldByName('DSC_TIPO').AsString := 'Receita';
  if Cds.FieldByName('RECCUSTO').AsString = 'C' then Cds.FieldByName('DSC_TIPO').AsString := 'Despesa';
  if Cds.FieldByName('RECCUSTO').AsString = 'O' then Cds.FieldByName('DSC_TIPO').AsString := 'Operação';
  if Cds.FieldByName('RECCUSTO').AsString = 'I' then Cds.FieldByName('DSC_TIPO').AsString := 'Item de cálculo';

  if Cds.FieldByName('FLGTIPOOPER').AsString = 'A' then Cds.FieldByName('DESC_TIPOOPER').AsString := 'Acréscimo';
  if Cds.FieldByName('FLGTIPOOPER').AsString = 'D' then Cds.FieldByName('DESC_TIPOOPER').AsString := 'Desconto';

  Accept := CtrlTipoCustoRecImov.GravaTipoCustoRecImov;
end;


procedure TfrmCadTipoCustoRecMT.DBrdgCustoRecClick(Sender: TObject);
begin
  inherited;

  DBcboTipoDoc.Enabled := True;
  dbrgDiario.Enabled   := True;
  if Cds.State in [dsInsert, dsEdit] then begin
    Cds.FieldByName('CODTIPDOC').Clear;
    Cds.FieldByName('IDOPERCONTAB').Clear;
    Cds.FieldByName('FLGDIARIO').AsString := 'N';
    if DBrdgCustoRec.ItemIndex = 2 then Cds.FieldByName('FLGRENTAB').AsInteger := 0;
  end;

  if Sistema.IdModulo = 135 then begin  // Alienação
    lblOperContab.Enabled  := False;
    dblcOperContab.Enabled := False;

    //Ricardo Cristiano - SOL Nº 44015 KINTANA Nº 523387 - INI
    DBrdgTipoOper.Visible  := (DBrdgCustoRec.ItemIndex in [0,1,2]);

    if DBrdgCustoRec.ItemIndex = 0 then
       CdsTipoDocumento.Data := CtrlTipodocRecPag.ListTipodocrecpag('P', 0) // Despesa
    else
    if DBrdgCustoRec.ItemIndex = 1 then
       CdsTipoDocumento.Data := CtrlTipodocRecPag.ListTipodocrecpag('R', 0) // Receita
       //Ricardo Cristiano - SOL Nº 44015 KINTANA Nº 523387 - FIM
    else begin
       DBcboTipoDoc.Enabled := False;
    end;
    dbchkBloqJudicial.Visible := False;
  end
  else
  begin                        // AdminImob e InvestImob
    DBrdgTipoOper.Visible  := False;
    dbchkBloqJudicial.Visible := False;

    if DBrdgCustoRec.ItemIndex = 0 then begin
      CdsTipoDocumento.Data  := CtrlTipodocRecPag.ListTipodocrecpag('P', 0);  // Despesa
      lblOperContab.Enabled  := False;
      dblcOperContab.Enabled := False;
      dbFlgRentab.Enabled    := True;

      //Cássio Rovaroto - SIG nº 115585 - Início
      //Cássio Rovaroto - SIG nº 23656.59194 - Início
      //if Sistema.IdModulo = 64 then
      //	chkMaoDeObra.Visible := True;
      //Cássio Rovaroto - SIG nº 23656.59194 - Fim
      //Cássio Rovaroto - SIG nº 115585 - Fim
    end else if DBrdgCustoRec.ItemIndex = 1 then begin
      CdsTipoDocumento.Data  := CtrlTipodocRecPag.ListTipodocrecpag('R', 0);  // Receita
      lblOperContab.Enabled  := True;
      dblcOperContab.Enabled := True;
      dbFlgRentab.Enabled    := True;

      //Cássio Rovaroto - SIG nº 115585 - Início
      //Cássio Rovaroto - SIG nº 23656.59194 - Início
      //if Sistema.IdModulo = 64 then
      //begin
      //  dbchkBloqJudicial.Visible := True;
      //end;
      //chkMaoDeObra.Visible := False;
      //chkMaoDeObra.Checked := False;
      //Cássio Rovaroto - SIG nº 23656.59194 - Fim
      //Cássio Rovaroto - SIG nº 115585 - Fim
         
    end else if DBrdgCustoRec.ItemIndex = 3 then begin
      DBcboTipoDoc.Enabled   := False;
      dbrgDiario.Enabled     := False;
      dbFlgRentab.Enabled    := False;
      lblOperContab.Enabled  := False;
      dblcOperContab.Enabled := False;
      DBrdgTipoOper.Visible  := False;
      //Cássio Rovaroto - SIG nº 115585 - Início
      //Cássio Rovaroto - SIG nº 23656.59194 - Início
      //chkMaoDeObra.Visible   := False;
      //chkMaoDeObra.Checked := False;
      //Cássio Rovaroto - SIG nº 23656.59194 - Fim
      //Cássio Rovaroto - SIG nº 115585
    end else begin
      DBcboTipoDoc.Enabled   := False;
      dbrgDiario.Enabled     := False;
      dbFlgRentab.Enabled    := False;
      lblOperContab.Enabled  := False;
      dblcOperContab.Enabled := False;
      //Cássio Rovaroto - SIG nº 115585 - Início
      //Cássio Rovaroto - SIG nº 23656.59194 - Início
      //chkMaoDeObra.Visible   := False;
      //chkMaoDeObra.Checked := False;
      //Cássio Rovaroto - SIG nº 23656.59194 - Fim
      //Cássio Rovaroto - SIG nº 115585

      if Sistema.IdModulo = 64 then begin DBrdgTipoOper.Visible  := True; end;
      
    end;
  end;
end;

procedure TfrmCadTipoCustoRecMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  // a linha abaixo força a abertura do CdsTipoDocumento
  Cds.FieldByName('RECCUSTO').AsString  := 'R';
  // setar contabilização diária com default 'N'
  Cds.FieldByName('FLGDIARIO').AsString := 'N';
  DBrdgCustoRecClick(Sender);
end;


procedure TfrmCadTipoCustoRecMT.CmeCadastroEdit(Sender: TObject);
begin
  Cds.Data := CtrlTipoCustoRecImov.LookupTipoCustoRecImov (Sistema.IdModulo, '', Cds.FieldByName('IDTIPOCUSTORECIMO').AsInteger);
  inherited;
  //Cássio Rovaroto - SIG nº 115585 - Início
  //Cássio Rovaroto - SIG nº 23656.59194
  //chkMaoDeObra.Checked := Cds.FieldByName('FLGMAODEOBRA').AsString = 'S';
  //Cássio Rovaroto - SIG nº 115585 - Fim
end;

procedure TfrmCadTipoCustoRecMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(CtrlTipoCustoRecImov);
  FreeAndNil(CtrlTipodocRecPag);
end;

procedure TfrmCadTipoCustoRecMT.AjustarModulo;
begin
  // Habilita o panel de integração com o Caf para o InvestImob
  panCAF.Visible    := Sistema.IdModulo = 54;
  // Habilita o panel de Diário para o AdminImob e Alienação
  panDiario.Visible := ( (Sistema.IdModulo = 64)  and (ModuloImobiliario.AdminImob.bFlgDiario) ) or
                       ( (Sistema.IdModulo = 135) and (ModuloImobiliario.Alienacao.bFlgDiario) );

  // Habilita a seleção de segunda operação contábil apenas para o Adminimob
  lblOperContab.Visible  := (Sistema.IdModulo = 64);
  dblcOperContab.Visible := (Sistema.IdModulo = 64);

  DBrdgCustoRec.Width   := 474;
  DBrdgCustoRec.Columns := 4;

  // Ajusta as opções de Tipo de Receita, Despesa, Operação
  if Sistema.IdModulo = 135 then begin             // Alienação
     //Ricardo Cristiano - SOL Nº 44015 KINTANA Nº 523387
     lblDescricao.Caption := 'Tipo de Despesa / Receita / Operação';
     DBrdgCustoRec.Columns := 3;
     DBrdgCustoRec.Items.Clear;
     //Ricardo Cristiano - SOL Nº 44015 KINTANA Nº 523387
     DBrdgCustoRec.Items.Add('Despesa');
     DBrdgCustoRec.Items.Add('Receita');
     DBrdgCustoRec.Items.Add('Operação');
     DBrdgCustoRec.Values.Clear;
     //Ricardo Cristiano - SOL Nº 44015 KINTANA Nº 523387
     DBrdgCustoRec.Values.Add('C');
     DBrdgCustoRec.Values.Add('R');
     DBrdgCustoRec.Values.Add('O');
//Ricardo Cristiano - SOL Nº 44015 KINTANA Nº 523387
//     DBrdgCustoRec.Width   := 185;
     chkFLGRECCUSTCONTRATO.Visible := False; //Cássio Rovaroto - SIG nº 103856

  end else if Sistema.IdModulo = 64 then begin    // Adminimob
     lblDescricao.Caption := 'Tipo de Despesa / Receita / Operação';
     DBrdgCustoRec.Columns := 4;
     DBrdgCustoRec.Items.Clear;
     DBrdgCustoRec.Items.Add('Despesa');
     DBrdgCustoRec.Items.Add('Receita');
     DBrdgCustoRec.Items.Add('Operação');
     DBrdgCustoRec.Items.Add('Item de cálculo');
     DBrdgCustoRec.Values.Clear;
     DBrdgCustoRec.Values.Add('C');
     DBrdgCustoRec.Values.Add('R');
     DBrdgCustoRec.Values.Add('O');
     DBrdgCustoRec.Values.Add('I');
  end else begin                                   // InvestImob
     lblDescricao.Caption := 'Tipo de Despesa / Receita';
     DBrdgCustoRec.Items.Clear;
     DBrdgCustoRec.Items.Add('Despesa');
     DBrdgCustoRec.Items.Add('Receita');
     DBrdgCustoRec.Values.Clear;
     DBrdgCustoRec.Values.Add('C');
     DBrdgCustoRec.Values.Add('R');
     chkFLGRECCUSTCONTRATO.Visible := False; //Cássio Rovaroto - SIG nº 103856
  end;

  // Ajusta as opções de Contabilização Diária
  if Sistema.IdModulo = 135 then begin    // Alienação
    dbrgDiario.Items.Clear;
    dbrgDiario.Items.Add('Periodicidade Mensal');
    dbrgDiario.Items.Add('Não Possui');
    dbrgDiario.Values.Clear;
    dbrgDiario.Values.Add('M');
    dbrgDiario.Values.Add('N');
    chkFLGRECCUSTCONTRATO.Visible := False; //Cássio Rovaroto - SIG nº 103856
  end else begin
    dbrgDiario.Items.Clear;
    dbrgDiario.Items.Add('Periodicidade Mensal');
    dbrgDiario.Items.Add('Periodicidade Anual');
    dbrgDiario.Items.Add('Não Possui');
    dbrgDiario.Values.Clear;
    dbrgDiario.Values.Add('M');
    dbrgDiario.Values.Add('A');
    dbrgDiario.Values.Add('N');
  end;

  //Cássio Rovaroto - sig nº 115585 - Início
  //Cássio Rovaroto - SIG nº 23656.59194
  //chkMaoDeObra.Visible := False;
  //Cássio Rovaroto - SIG nº 115585 
end;

procedure TfrmCadTipoCustoRecMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  if (Cds.FieldByName('RECCUSTO').AsString[1] in ['R','C']) and (DBcboTipoDoc.LookupValue = '') then begin
     MsgDlg('Informe o Tipo de Documento','Aviso',mtWarning,[mbOk],0);
     Accept := False;
  end;

  //Cássio Rovaroto - SIG nº 115585 - Início
	//Cássio Rovaroto - SIG nº 23656.59194 - Início
  //if chkMaoDeObra.Checked then
  //  Cds.FieldByName('FLGMAODEOBRA').AsString := 'S'
  //else
  //  Cds.FieldByName('FLGMAODEOBRA').AsString := 'N';
  //Cássio Rovaroto - SIG nº 23656.59194 - Fim
  //Cássio Rovaroto - SIG nº 115585
end;

procedure TfrmCadTipoCustoRecMT.dbGrdTitleButtonClick(Sender: TObject; AFieldName: String);
begin
  inherited;
  cds.IndexFieldNames  := AFieldName;
end;

procedure TfrmCadTipoCustoRecMT.dblcOperContabExit(Sender: TObject);
begin
  inherited;
  if Trim(dblcOperContab.Text) = '' then
    CtrlTipoCustoRecImov.CdsTipoCustoRecImov.fieldbyname('IDOPERCONTAB').clear;
end;

end.



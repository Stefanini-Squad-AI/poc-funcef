// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor       : Paulo Ramos
// Data        : 17/04/2007
// Rotina      : qryDetAfterScroll
// Pendência   : 24983
// Alteração   : Evita erro na qryReservaAss quando qryDet está vazio. 
//------------------------------------------------------------------------------
// Autor       : Gleyber
// Data        : 30/08/2006
// Pendência   : 21894
// Alteração   : Criação de rotina para criação de layout personalizado por plano.
//------------------------------------------------------------------------------
// Autor       : Gleyber
// Data        : 21/02/2006
// Pendência   : 19946
// Alteração   : Criação de mais uma aba de reservas associadas
//------------------------------------------------------------------------------
unit FConfSimulaDeslig;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, Db, DBTables, Wwquery, CmEventosCadastro, ImgList,
  MontaSelect, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr,
  StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  TabControlDetalhe, ExtCtrls, DBCtrls, Mask, wwdbedit, uCMTypes, wwdblook,
  UMensErro, USistema, UDataBase, TB97Tlwn, ppModule, raCodMod, ppBands,
  ppClass, ppVar, ppCtrls, ppPrnabl, ppCache, ppProd, ppReport, ppDB,
  ppRelatv, ppDBPipe, ppDBBDE, ppComm, ppEndUsr;

type
  TFrmConfSimulaDeslig = class(TfrmCadMestreDetalheCS)
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    Label1: TLabel;
    edtNomePlano: TEdit;
    Label2: TLabel;
    qryEventos: TwwQuery;
    Label3: TLabel;
    dbcRodaRegraEleg: TDBCheckBox;
    dbeOrdem: TwwDBEdit;
    qryAux: TwwQuery;
    dblcEventoGerador: TwwDBLookupCombo;
    tbsDetRes: TTabSheet;
    pnlDet2: TPanel;
    Label4: TLabel;
    dblkReservaAssoc: TwwDBLookupCombo;
    dbgReservaAssociada: TwwDBGrid;
    ToolWindow971: TToolWindow97;
    edtNomeEvento: TEdit;
    qryReservas: TwwQuery;
    qryReservaAss: TwwQuery;
    dsReservaAss: TwwDataSource;
    updReservaAss: TUpdateSQL;
    tbsLayout: TTabSheet;
    DsgnCM: TppDesigner;
    qryExtSimDeslig: TwwQuery;
    dsExtSimDeslig: TwwDataSource;
    ppExtSimDeslig: TppBDEPipeline;
    ppExtSimDesligppField1: TppField;
    ppExtSimDesligppField2: TppField;
    ppExtSimDesligppField3: TppField;
    ppExtSimDesligppField4: TppField;
    ppExtSimDesligppField5: TppField;
    ppExtSimDesligppField6: TppField;
    ppExtSimDesligppField7: TppField;
    ppExtSimDesligppField8: TppField;
    ppExtSimDesligppField9: TppField;
    ppExtSimDesligppField10: TppField;
    ppExtSimDesligppField11: TppField;
    ppExtSimDesligppField12: TppField;
    ppExtSimDesligppField13: TppField;
    rpExtSimDeslig: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel24: TppLabel;
    ppDBText42: TppDBText;
    ppDBText43: TppDBText;
    ppDBText45: TppDBText;
    ppLabel63: TppLabel;
    ppDBText54: TppDBText;
    ppDBImage1: TppDBImage;
    ppLabel27: TppLabel;
    ppDBText32: TppDBText;
    ppLabel28: TppLabel;
    ppDBText33: TppDBText;
    ppLabel29: TppLabel;
    ppDBText35: TppDBText;
    ppLabel33: TppLabel;
    ppDBText36: TppDBText;
    ppLabel34: TppLabel;
    ppDBText37: TppDBText;
    ppLine24: TppLine;
    ppLine4: TppLine;
    ppLabel4: TppLabel;
    ppLine5: TppLine;
    ppDetailBand1: TppDetailBand;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppDBText1: TppDBText;
    ppLine3: TppLine;
    ppLine1: TppLine;
    ppDBText4: TppDBText;
    ppLabel1: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    pnlLayout: TPanel;
    pnlBotao: TPanel;
    btnDesenho: TBitBtn;
    memLog: TRichEdit;
    procedure FormShow(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure qryDetBeforePost(DataSet: TDataSet);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure qryDetAfterScroll(DataSet: TDataSet);
    procedure dblkReservaAssocCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcEventoGeradorExit(Sender: TObject);
    procedure tbsLayoutShow(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure btnDesenhoClick(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
  private
    { Private declarations }
  public
    OperacaoDetalhe  : TOperacao;  
    bCriaTemplate    : Boolean;    
    { Public declarations }
  end;

var
  FrmConfSimulaDeslig: TFrmConfSimulaDeslig;

implementation

{$R *.DFM}

procedure TFrmConfSimulaDeslig.FormShow(Sender: TObject);
begin
  inherited;
  // Inicialização das Variaveis
  edtNomePlano.Text := '';

  // Inicialização das queries
  qry.ParamByName('PIDPLANOPREV').AsInteger := -1;
  qry.Open;

  qryDet.ParamByName('PIDPLANOPREV').AsInteger := -1;
  qryDet.Open;

  qryEventos.Open;

  // Apresentação
  dbgrdDet.BringToFront;
  dbgReservaAssociada.BringToFront;
  pgctrlDetalhe.ActivePage := tbsDet;
  pnlLayout.Enabled        := False;
end;

procedure TFrmConfSimulaDeslig.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor
   Then Begin
     qry.Close;
     qry.ParamByName('PIDPLANOPREV').AsInteger := StrToInt(MontaSelect.ValoresChave[0]);
     qry.Open;

     qryDet.Close;
     qryDet.ParamByName('PIDPLANOPREV').AsInteger := StrToInt(MontaSelect.ValoresChave[0]);
     qryDet.Open;

     qryReservas.Close;
     qryReservas.ParamByName('PIDPLANOPREV').AsInteger := StrToInt(MontaSelect.ValoresChave[0]);
     qryReservas.Open;

     qryReservaAss.Close;
     qryReservaAss.ParamByName('PIDPLANOPREV').AsInteger := StrToInt(MontaSelect.ValoresChave[0]);
     qryReservaAss.Open;

     edtNomePlano.Text := qry.FieldByName('NOME').AsString;
     pnlLayout.Enabled        := False;

   End;
end;

procedure TFrmConfSimulaDeslig.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  OperacaoDetalhe := opInserir;    
  If pgctrlDetalhe.ActivePage = tbsDet
   Then Begin
     qryDet.FieldByName('IDCFGSIMULADESLIG').AsInteger := LeUltRegistro(nil,'CFGSIMULADESLIG');         
     qryDet.FieldByName('IDPLANOPREV').AsInteger       := qry.FieldByName('IDPLANOPREV').AsInteger;
     qryDet.FieldByName('FLGRODAELEG').AsInteger       := 0;
   End
   
   Else Begin
     qryReservaAss.FieldByName('IDRESERVADESLIG').AsInteger   := LeUltRegistro(nil,'CFGSIMULADESLIG');
     qryReservaAss.FieldByName('IDCFGSIMULADESLIG').AsInteger := qryDet.FieldByName('IDCFGSIMULADESLIG').AsInteger;
   End;
   
end;

procedure TFrmConfSimulaDeslig.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  
  If qryDet.State in [dsEdit, dsInsert, dsBrowse]
   Then AplicaAlteracoes([qryDet, qryReservaAss])
   Else AplicaAlteracoes([qryReservaAss, qryDet]);
  
  pnlLayout.Enabled := True;  
end;

procedure TFrmConfSimulaDeslig.qryDetBeforePost(DataSet: TDataSet);
begin
  inherited;
  qryDet.FieldByName('NOMEEVENTO').AsString := dblcEventoGerador.Text;
  edtNomeEvento.Text := qryEventos.FieldByName('NOME').AsString;
end;

procedure TFrmConfSimulaDeslig.bbtnOkDetClick(Sender: TObject);
begin
  If pgctrlDetalhe.ActivePage = tbsDet
   Then Begin
    If Trim(dblcEventoGerador.Text) = ''
     Then Begin
       MsgDlg('É necessário o preenchimento do Evento Gerador!!','ATENÇÃO',mtWarning,[mbOK],0);
       dblcEventoGerador.SetFocus;
     End;

    If Trim(dbeOrdem.Text) = ''
     Then Begin
       MsgDlg('É necessário informar o nº da sequencia em que o evento será impresso!!','ATENÇÃO',mtWarning,[mbOK],0);
       dbeOrdem.SetFocus;
     End;
   End
   
   Else Begin
    If Trim(dblkReservaAssoc.Text) = ''
     Then Begin
       MsgDlg('É necessário informar a reserva a ser associada ao evento.!!','ATENÇÃO',mtWarning,[mbOK],0);
       dblkReservaAssoc.SetFocus;
     End;
   End;
   
  inherited;
end;


procedure TFrmConfSimulaDeslig.qryDetAfterScroll(DataSet: TDataSet);
begin
  inherited;
  If qryDet.State = dsInsert
   Then Begin
     edtNomeEvento.Text := '';
     Exit;
   End;
  edtNomeEvento.Text := qryEventos.FieldByName('NOME').AsString;

  If not qryDet.isempty Then 
    If qryReservaAss.Active
     Then Begin
       qryReservaAss.Filtered := False;
       qryReservaAss.Filter   := 'IDCFGSIMULADESLIG = '+qryDet.FieldByName('IDCFGSIMULADESLIG').AsString;
       qryReservaAss.Filtered := True;
       qryReservaAss.First;
     End;
end;

procedure TFrmConfSimulaDeslig.dblkReservaAssocCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If qryReservaAss.State = dsInsert
   Then Begin
     qryReservaAss.FieldByName('CODHIERARQUIA').AsString := qryReservas.FieldByName('CODHIERARQUIA').AsString;
     qryReservaAss.FieldByName('NOME').AsString          := qryReservas.FieldByName('NOME').AsString;
   End;
end;

procedure TFrmConfSimulaDeslig.dblcEventoGeradorExit(Sender: TObject);
begin
  inherited;
  If qryDet.State = dsInsert
   Then Begin
     edtNomeEvento.Text := qryEventos.FieldByName('NOME').AsString;

     If qryReservaAss.Active
      Then Begin
        qryReservaAss.Filtered := False;
        qryReservaAss.Filter   := 'IDCFGSIMULADESLIG = '+qryDet.FieldByName('IDCFGSIMULADESLIG').AsString;
        qryReservaAss.Filtered := True;
        qryReservaAss.First;
      End;
   End;
end;

procedure TFrmConfSimulaDeslig.tbsLayoutShow(Sender: TObject);
begin
  inherited;
  btnDesenho.Height := (pnlBotao.Height-1);
  btnDesenho.Width  := (pnlBotao.Width-3);
end;

procedure TFrmConfSimulaDeslig.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  OperacaoDetalhe := opAlterar;    
end;

procedure TFrmConfSimulaDeslig.btnDesenhoClick(Sender: TObject);
Var
  sNomeArqOrig,
  sNomeArqNovo    : String;
  fTemplateOrig,
  fTemplateNovo   : TStrings;
begin
  inherited;
  sNomeArqOrig     := Sistema.TempDir + 'relsdo.tcm';
  sNomeArqNovo     := Sistema.TempDir + 'relsdn.tcm';
  fTemplateOrig    := TStringList.Create;
  fTemplateNovo    := TStringList.Create;
  fTemplateOrig.Clear;
  fTemplateNovo.Clear;

  // Guarda a Template Original
  DsgnCM.Report.Template.FileName := sNomeArqOrig;
  DsgnCM.Report.Template.SaveToFile;
  fTemplateOrig.LoadFromFile(sNomeArqOrig);

  // Caso Haja template modificada carrega em um arquivo e deste para o Report
  If Not qryDet.FieldByName('TEMPLATE').IsNull
   Then Begin
      fTemplateNovo.Add(qryDet.FieldByName('TEMPLATE').AsString);
      fTemplateNovo.SaveToFile(sNomeArqNovo);

      rpExtSimDeslig.Template.DatabaseSettings.Name := 'Personalização de Relatório para o plano '+edtNomePlano.Text;
      DsgnCM.Report.Template.FileName               := sNomeArqNovo;
      DsgnCM.Report.Template.LoadFromFile;
   End;

  DsgnCM.ShowModal;

  DsgnCM.Report.Template.FileName                   := sNomeArqNovo;
  DsgnCM.Report.Template.SaveToFile;

  fTemplateNovo.Clear;
  fTemplateNovo.LoadFromFile(sNomeArqNovo);

  // Se houve modificações então grava no banco
  If MessageDlg('Deseja salvar o relatório personalizado no banco ?', mtConfirmation,[mbYes, mbNo],0) = mrYes
   Then Begin
     qryDet.Edit;                            
     TBlobField(qryDet.FieldByName('TEMPLATE')).LoadFromFile(sNomeArqNovo);
     qryDet.Post;
   End;

  DsgnCM.Report.Template.FileName                   := sNomeArqOrig;
  DsgnCM.Report.Template.LoadFromFile;

  fTemplateOrig.Free;
  fTemplateNovo.Free;

  If FileExists(sNomeArqOrig) Then  DeleteFile(sNomeArqOrig);
  If FileExists(sNomeArqNovo) Then  DeleteFile(sNomeArqNovo);
end;

procedure TFrmConfSimulaDeslig.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  pnlLayout.Enabled := True;
end;

procedure TFrmConfSimulaDeslig.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  pnlLayout.Enabled := False;
end;

end.

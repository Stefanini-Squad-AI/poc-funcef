unit FCadMovReservaTree;

// Alterações:
//--------------------------------------------------------------------------------------------------
// Rotina      : novas funcoes VerificaContas, VerificaContaContabil e VerificaCentroCusto, chamadas
//               no bbtnOkDetClick
// Autor(a)    : André Pontes
// Data        : 21/11/2006 a 22/11/2006
// Pendência   : 20949
// Alteração   : Crítica das contas contábeis no momento do cadastro
//--------------------------------------------------------------------------------------------------
// Rotina      : Várias
// Autor(a)    : Augusto
// Data        : 11/01/2005
// Pendência   :
// Alteração   : Aumenta na larguras dos componentes da tela
//--------------------------------------------------------------------------------------------------
// Rotina      : Várias
// Autor(a)    : Augusto
// Data        : 08/10/2004
// Pendência   : 15136
// Alteração   : Acerto na atualização dos campos PLACONTACDEST E PLACONTADDEST
//--------------------------------------------------------------------------------------------------
// Rotina      : Várias
// Autor(a)    : Camille
// Data        : 29.07.2004
// Pendência   : 15136
// Alteração   : Criar parametros para contabilizacao do movimento de reserva
//               PLACONTACDEST E PLACONTADDEST
//--------------------------------------------------------------------------------------------------
// Rotina      : Várias
// Autor(a)    : Camille
// Data        : 19.09.2003
// Pendência   : 14814
// Alteração   : Criar campo Regra de Valor de Retorno
//--------------------------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, ExtCtrls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  Grids, Wwdbigrd, Wwdbgrid, TB97Ctls, ComCtrls, Db, DBTables, Wwquery,
  Wwdatsrc, wwdblook, TREdit, IvDictio, IvMulti, IvEMulti, ImgList, CMTree,
  Mask;

type
  TfrmCadMovReservaTree = class(TfrmOkCancelar)
    pnlevento: TPanel;
    Splitter1: TSplitter;
    pnlgrid: TPanel;
    Dock972: TDock97;
    Toolbar971: TToolbar97;
    sbtnInserir: TToolbarButton97;
    sbtnAlterar: TToolbarButton97;
    sbtnApagar: TToolbarButton97;
    wwDBGrid1: TwwDBGrid;
    trvEventosBenef: TTreeView;
    Label1: TLabel;
    qry: TwwQuery;
    qryEvento: TwwQuery;
    qrybeneficio: TwwQuery;
    ds: TwwDataSource;
    ImageList1: TImageList;
    qrypatroorig: TwwQuery;  
    qryplanoorig: TwwQuery;
    qryreservaorig: TwwQuery;
    qryreservadest: TwwQuery;
    qryplanodest: TwwQuery;
    qrypatrodest: TwwQuery;
    qryregraval: TwwQuery;
    qryregra: TwwQuery;
    qryaux: TwwQuery;
    pnlop: TPanel;
    pgctrlMovReserva: TPageControl;
    tbsInfPrincipais: TTabSheet;
    tbsContabiliza: TTabSheet;
    pnlBotoesMovReserva: TPanel;
    bbtnOkDet: TBitBtn;
    bbtnCancelarDet: TBitBtn;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    cmbpatroorig: TwwDBLookupCombo;
    cmbplanoorig: TwwDBLookupCombo;
    cmbreservaorig: TwwDBLookupCombo;
    cmbpatrodest: TwwDBLookupCombo;
    cmbplanodest: TwwDBLookupCombo;
    cmbreservadest: TwwDBLookupCombo;
    GroupBox2: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    cmbregra: TwwDBLookupCombo;
    cmbregraval: TwwDBLookupCombo;
    dbredseqnum: TRealEdit;
    grpDebContab: TGroupBox;
    spdContaContabilD: TSpeedButton;
    lblPlaContaD: TLabel;
    edContaContabilD: TMaskEdit;
    GroupBox4: TGroupBox;
    lbDescricaoContaD: TLabel;
    grpCreContab: TGroupBox;
    spdContaContabilC: TSpeedButton;
    lbConta1: TLabel;
    edContaContabilC: TMaskEdit;
    grbGrConta1: TGroupBox;
    lbDescricaoContaC: TLabel;
    qryCCustoD: TwwQuery;
    qryCCustoC: TwwQuery;
    qrySubConta: TwwQuery;
    qryAtividade: TwwQuery;
    chkContabiliza: TCheckBox;
    qryContaContabilD: TwwQuery;
    qryContaContabilDPLACONTA: TStringField;
    qryContaContabilDPLANOME: TStringField;
    qryContaContabilDPLATIPO: TStringField;
    dsContaContabilD: TwwDataSource;
    qryContaContabilC: TwwQuery;
    dsContaContabilC: TwwDataSource;
    qryContaContabilCPLACONTA: TStringField;
    qryContaContabilCPLANOME: TStringField;
    qryContaContabilCPLATIPO: TStringField;
    qryContaContabilCPLACCUST: TStringField;
    treeContaContabilD: TCMTreeView;
    treeContaContabilC: TCMTreeView;
    qryInsert: TwwQuery;
    qryEdit: TwwQuery;
    qryRegraZera: TwwQuery;
    Label12: TLabel;
    cmbregrazera: TwwDBLookupCombo;
    Label13: TLabel;
    dblkpcmbRegraRetorno: TwwDBLookupCombo;
    qryRegraRetorno: TwwQuery;
    GroupBox5: TGroupBox;
    cmbCCustoD: TwwDBLookupCombo;
    GroupBox6: TGroupBox;
    cmbCCustoC: TwwDBLookupCombo;
    GroupBox7: TGroupBox;
    dblkSubconta: TwwDBLookupCombo;
    GroupBox8: TGroupBox;
    lkcmbDescAtividade: TwwDBLookupCombo;
    grpDebContabDest: TGroupBox;
    spdContaContabilDDest: TSpeedButton;
    lblPlaContaDDest: TLabel;
    edContaContabilDDest: TMaskEdit;
    GroupBox9: TGroupBox;
    lbDescricaoContaDDest: TLabel;
    grpCreContabDest: TGroupBox;
    spdContaContabilCDest: TSpeedButton;
    lbConta1Dest: TLabel;
    edContaContabilCDest: TMaskEdit;
    grbGrConta1Dest: TGroupBox;
    lbDescricaoContaCDest: TLabel;
    qryContaContabilDDest: TwwQuery;
    dsContaContabilDDest: TwwDataSource;
    qryContaContabilCDest: TwwQuery;
    dsContaContabilCDest: TwwDataSource;
    treeContaContabilDDest: TCMTreeView;
    qryContaContabilDDestPLACONTA: TStringField;
    qryContaContabilDDestPLANOME: TStringField;
    qryContaContabilDDestPLATIPO: TStringField;
    qryContaContabilDDestPLACCUST: TStringField;
    qryContaContabilCDestPLACONTA: TStringField;
    qryContaContabilCDestPLANOME: TStringField;
    qryContaContabilCDestPLATIPO: TStringField;
    qryContaContabilCDestPLACCUST: TStringField;
    treeContaContabilCDest: TCMTreeView;

    procedure FormActivate(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure trvEventosBenefChange(Sender: TObject; Node: TTreeNode);
    procedure sbtnApagarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure sbtncopiaClick(Sender: TObject);
    procedure btncopiadestClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure qryplanoorigAfterScroll(DataSet: TDataSet);
    procedure qryplanodestAfterScroll(DataSet: TDataSet);
    procedure qrypatroorigAfterScroll(DataSet: TDataSet);
    procedure qrypatrodestAfterScroll(DataSet: TDataSet);
    procedure cmbpatroorigCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure cmbpatrodestCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure cmbplanoorigCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure cmbplanodestCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure chkContabilizaClick(Sender: TObject);
    procedure spdContaContabilDClick(Sender: TObject);
    procedure spdContaContabilCClick(Sender: TObject);
    procedure edContaContabilDExit(Sender: TObject);
    procedure treeContaContabilDDblClick(Sender: TObject);
    procedure treeContaContabilDExit(Sender: TObject);
    procedure treeContaContabilCDblClick(Sender: TObject);
    procedure treeContaContabilCExit(Sender: TObject);
    procedure edContaContabilCExit(Sender: TObject);
    procedure spdContaContabilDDestClick(Sender: TObject);
    procedure spdContaContabilCDestClick(Sender: TObject);
    procedure edContaContabilDDestExit(Sender: TObject);
    procedure treeContaContabilDDestDblClick(Sender: TObject);
    procedure treeContaContabilDDestExit(Sender: TObject);
    procedure treeContaContabilCDestDblClick(Sender: TObject);
    procedure treeContaContabilCDestExit(Sender: TObject);
    procedure edContaContabilCDestExit(Sender: TObject);

  private // Private declarations

    procedure TrazDados;
    procedure PegaIdBenef;
    procedure LimpaCampos;
    function  OpcoesOk : Boolean;

    
    function  VerificaContas: Boolean;

    function  VerificaContaContabil(const psConta      : String;
                                    const psCusto      : String;
                                    const piSubConta   : Integer;
                                    const piPlanoConta : Integer;
                                    var   psMsg        : String
                                   ): Boolean;

    function  VerificaCentroCusto(const psCusto: String): Boolean;
    

    
  public  // Public declarations 

     beneficio, evento, sidevento, sidbeneficio : String;
     bInseri : Boolean;


  end;



var
  frmCadMovReservaTree: TfrmCadMovReservaTree;



implementation
{$R *.DFM}
uses
  UAdmPrev, UDataBase, UMensErro, DBaseDados, USistema, UIntegraBack;



procedure TfrmCadMovReservaTree.LimpaCampos;
begin
  cmbPatroDest.Text             := '';
  cmbPlanoDest.Text             := '';
  cmbReservaDest.Text           := '';
  cmbPatroOrig.Text             := '';
  cmbPlanoOrig.Text             := '';
  cmbReservaOrig.Text           := '';
  cmbRegra.Text                 := '';
  cmbRegraVal.Text              := '';
  
  cmbRegraZera.Text             := '';
  dbredSeqNum.Text              := '';

  edContaContabilD.Text         := '';
  edContaContabilC.Text         := '';
  lbDescricaoContaD.Caption     := '';
  lbDescricaoContaC.Caption     := '';
  edContaContabilDDest.Text     := '';
  edContaContabilCDest.Text     := '';
  lbDescricaoContaDDest.Caption := '';
  lbDescricaoContaCDest.Caption := '';
  cmbCCustoD.Text               := '';
  cmbCCustoC.Text               := '';
  dblkSubconta.Text             := '';
  lkcmbDescAtividade.Text       := '';
end;



procedure TfrmCadMovReservaTree.FormActivate(Sender: TObject);
var
  i,j, into : Integer;
  MyTreeNode1  : TTreeNode; 
begin
   inherited;
   if  dtmBasedados.dbBaseDados.InTransaction then dtmBasedados.dbBaseDados.rollback;
   pnlgrid.Visible := True;
   pnlop.visible := False;
    
   bbtnConfirmar.enabled := False;
   bbtnCancelar.enabled := False;

   qryEvento.Open;
   qryEvento.First;
   trvEventosBenef.Items.Clear;
   Into:=-1;
   for i := 1 to qryEvento.recordcount do
   begin
      trvEventosBenef.Items.Add(nil,qryEvento.FieldByName('nome').AsString);
      Inc(Into);
      trvEventosBenef.Items[Into].ImageIndex    :=0;
      trvEventosBenef.Items[Into].SelectedIndex :=0;
      MyTreeNode1:= trvEventosBenef.Items[Into];

   
      qrybeneficio.close;
      qrybeneficio.sql.clear;
      qrybeneficio.sql.add(' SELECT NOME, IDBENEFICIO FROM BENEFICIO WHERE IDEVENTOGERADOR = '+qryEvento.FieldByName('IDEVENTOGERADOR').AsString+'');
      qrybeneficio.Open;

      if not qrybeneficio.isempty
      then begin
         qrybeneficio.First;
         for j := 0 to qrybeneficio.recordcount - 1 do
         begin
            trvEventosBenef.Items.AddChild(MyTreeNode1,
            qrybeneficio.FieldByName('nome').AsString);
            MyTreeNode1.GetLastChild.ImageIndex    :=1;
            MyTreeNode1.GetLastChild.SelectedIndex :=1;
            qrybeneficio.next;
            Inc(Into);
         end;
      end;
      qryEvento.next;
   end;
   binseri := False;

   TrazDados;

   qrypatroorig.close;
   qrypatrodest.close;

   
   If  sidbeneficio <> '' Then
     qrypatroorig.parambyname('IDBENEFICIO').AsString := sidbeneficio
   else
     qrypatroorig.parambyname('IDBENEFICIO').AsInteger := -1;

   qrypatroorig.Open;
   if not binseri then cmbpatroorig.text := qrypatroorig.FieldByName('NOME').AsString
   else cmbpatroorig.text := '';

   
   If  sidbeneficio <> '' Then
     qrypatrodest.parambyname('IDBENEFICIO').AsString := sidbeneficio
   else
     qrypatrodest.parambyname('IDBENEFICIO').AsInteger := -1;

   qrypatrodest.Open;
   if not binseri then cmbpatrodest.text := qrypatrodest.FieldByName('NOME').AsString
   else cmbpatrodest.text := '';

   qryregra.Open;
   qryregraval.Open;
   
   qryRegraZera.Open;
   qryRegraRetorno.Open; 

   // Abrir querys de Integracao Contabil
   qryAtividade.Close;
   qryAtividade.ParamByName('IDEMPRESA').AsInteger := Sistema.IdEmpresa;
   qryAtividade.Open;

   qrySubConta.Close;
   qrySubConta.ParamByName('IDEMPRESA').AsInteger := Sistema.IdEmpresa;
   qrySubConta.Open;

   qryContaContabilD.Close;
   qryContaContabilD.ParamByName('PLANO').AsInteger := IntegraBack.Plano;
   qryContaContabilD.Open;

   qryContaContabilC.Close;
   qryContaContabilC.ParamByName('PLANO').AsInteger := IntegraBack.Plano;
   qryContaContabilC.Open;

   qryContaContabilDDest.Close;
   qryContaContabilDDest.ParamByName('PLANO').AsInteger := IntegraBack.Plano;
   qryContaContabilDDest.Open;

   qryContaContabilCDest.Close;
   qryContaContabilCDest.ParamByName('PLANO').AsInteger := IntegraBack.Plano;
   qryContaContabilCDest.Open;

   qryCCustoC.Close;
   qryCCustoC.ParamByName('IDEMPRESA').AsInteger := Sistema.IdEmpresa;
   qryCCustoC.ParamByName('PLANO').AsInteger     := IntegraBack.Plano;
   qryCCustoC.ParamByName('PLACONTA').AsString   := '0';
   qryCCustoC.Open;

   qryCCustoD.Close;
   qryCCustoD.ParamByName('IDEMPRESA').AsInteger := Sistema.IdEmpresa;
   qryCCustoD.ParamByName('PLANO').AsInteger     := IntegraBack.Plano;
   qryCCustoD.ParamByName('PLACONTA').AsString   := '0';
   qryCCustoD.Open;

   treeContaContabilD.Mascara       := IntegraBack.MascaraPlano;
   treeContaContabilC.Mascara       := IntegraBack.MascaraPlano;
   treeContaContabilDDest.Mascara   := IntegraBack.MascaraPlano;
   treeContaContabilCDest.Mascara   := IntegraBack.MascaraPlano;
   edContaContabilD.EditMask        := IntegraBack.MascaraPlano + ';0; ';
   edContaContabilC.EditMask        := IntegraBack.MascaraPlano + ';0; ';
   edContaContabilDDest.EditMask    := IntegraBack.MascaraPlano + ';0; ';
   edContaContabilCDest.EditMask    := IntegraBack.MascaraPlano + ';0; ';
   treeContaContabilD.MontaArvore;
   treeContaContabilC.MontaArvore;
   treeContaContabilDDest.MontaArvore;
   treeContaContabilCDest.MontaArvore;
end;

procedure TfrmCadMovReservaTree.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  if not dtmBasedados.dbBaseDados.InTransaction then
  dtmBasedados.dbBaseDados.StartTransaction;

  qrypatroorig.close;
  qrypatrodest.close;

  
  If  sidbeneficio <> '' Then
    qrypatroorig.parambyname('IDBENEFICIO').AsString := sidbeneficio
  else
    qrypatroorig.parambyname('IDBENEFICIO').AsInteger := -1;

  qrypatroorig.Open;

  
  If  sidbeneficio <> '' Then
    qrypatrodest.parambyname('IDBENEFICIO').AsString := sidbeneficio
  else
     qrypatrodest.parambyname('IDBENEFICIO').AsInteger := -1;

  qrypatrodest.Open;

  LimpaCampos;

  bbtnConfirmar.enabled := False;
  bbtnCancelar.enabled := False;

  pnlgrid.Visible := False;
  pnlop.visible := True;
  bInseri := True;
  tbsContabiliza.TabVisible := False;
  sbtnInserir.Down := False;
end;

procedure TfrmCadMovReservaTree.sbtnAlterarClick(Sender: TObject);
begin
  inherited;

  LimpaCampos;

  if not qry.isempty
  then begin
     if not dtmBasedados.dbBaseDados.InTransaction
     then dtmBasedados.dbBaseDados.StartTransaction;

     if qry.FieldByName('idpatroorig').AsString <> ''
     then begin
         qrypatroorig.Locate('idpessoa',qry.FieldByName('idpatroorig').AsString,[locaseinsensitive]);
         cmbpatroorig.text :=  qrypatroorig.FieldByName('nome').AsString;
         cmbpatroorig.PerformSearch;
     end;

     if qry.FieldByName('idpatrodest').AsString <> ''
     then begin
         qrypatrodest.Locate('idpessoa',qry.FieldByName('idpatrodest').AsString,[locaseinsensitive]);
         cmbpatrodest.Text := qrypatrodest.FieldByName('nome').AsString ;
         cmbpatrodest.PerformSearch;
     end
     else cmbpatrodest.text := '';

     if qry.FieldByName('idplanoprevorig').AsString <> ''
     then begin
         qryplanoorig.Locate('idplanoprev',qry.FieldByName('idplanoprevorig').AsString,[locaseinsensitive]);
         cmbplanoorig.text := qryplanoorig.FieldByName('nome').AsString ;
         cmbplanoorig.PerformSearch;
     end;

     if qry.FieldByName('idplanoprevdest').AsString <> ''
     then begin
         qryplanodest.Locate('idplanoprev',qry.FieldByName('idplanoprevdest').AsString,[locaseinsensitive]);
         cmbplanodest.text := qryplanodest.FieldByName('nome').AsString ;
         cmbplanodest.PerformSearch;
     end
     else cmbplanodest.text := '';

     if qry.FieldByName('idtiporeservaorig').AsString <> ''
     then begin
         qryreservaorig.Locate('idtiporeserva',qry.FieldByName('idtiporeservaorig').AsString,[locaseinsensitive]);
         cmbreservaorig.text := qryreservaorig.FieldByName('nome').AsString ;
         cmbreservaorig.PerformSearch;
     end;

     if qry.FieldByName('idtiporeservadest').AsString <> ''
     then begin
         qryreservadest.Locate('idtiporeserva',qry.FieldByName('idtiporeservadest').AsString,[locaseinsensitive]);
         cmbreservadest.text := qryreservadest.FieldByName('nome').AsString ;
         cmbreservadest.PerformSearch;
     end
     else cmbreservadest.text := '';

     if qry.FieldByName('idregra').AsString <> ''
     then begin
         qryregra.Locate('idregra',qry.FieldByName('idregra').AsString,[locaseinsensitive]);
         cmbregra.Text := qryregra.FieldByName('nomeregra').AsString  ;
         cmbregra.PerformSearch;
     end;

     if qry.FieldByName('idregravalidacao').AsString <> ''
     then begin
         qryregraval.Locate('idregra',qry.FieldByName('idregravalidacao').AsString,[locaseinsensitive]);
         cmbregraval.Text := qryregraval.FieldByName('nomeregra').AsString  ;
         cmbregraval.PerformSearch;
     end;

     
     if qry.FieldByName('idregrazeravalor').AsString <> ''
     then begin
         qryregrazera.Locate('idregra',qry.FieldByName('idregrazeravalor').AsString,[locaseinsensitive]);
         cmbregrazera.Text := qryregrazera.FieldByName('nomeregra').AsString;
         cmbregrazera.PerformSearch;
     end;

     
     if qry.FieldByName('IDREGRARETORNO').AsString <> ''
     then begin
         qryRegraRetorno.Locate('idregra',qry.FieldByName('IDREGRARETORNO').AsString,[locaseinsensitive]);
         dblkpcmbRegraRetorno.Text := qryRegraRetorno.FieldByName('NOMEREGRA').AsString;
         dblkpcmbRegraRetorno.PerformSearch;
     end;

     if qry.FieldByName('seqmov').AsString <> ''
     then dbredseqnum.text := qry.FieldByName('seqmov').AsString ;

     if qry.FieldByName('FLGCONTABILIZA').AsInteger = 1
     then begin
        tbsContabiliza.TabVisible := True;
        chkContabiliza.Checked    := True;
     end
     else begin
        tbsContabiliza.TabVisible := False;
        chkContabiliza.Checked    := False;
     end;

     if qry.FieldByName('PLACONTAC').AsString <> ''
     then begin
        edContaContabilC.Text := qry.FieldByName('PLACONTAC').AsString;
        qryContaContabilC.Locate('PLACONTA', qry.FieldByName('PLACONTAC').AsString, [loCaseInsensitive]);
     end;

     if qry.FieldByName('PLACONTAD').AsString <> ''
     then begin
        edContaContabilD.Text := qry.FieldByName('PLACONTAD').AsString;
        qryContaContabilD.Locate('PLACONTA', qry.FieldByName('PLACONTAD').AsString, [loCaseInsensitive]);
     end;

     
     if qry.FieldByName('PLACONTACDEST').AsString <> ''
     then begin
        edContaContabilCDEST.Text := qry.FieldByName('PLACONTACDEST').AsString;
        qryContaContabilCDest.Locate('PLACONTA', qry.FieldByName('PLACONTACDEST').AsString, [loCaseInsensitive]);
     end;

     if qry.FieldByName('PLACONTADDEST').AsString <> ''
     then begin
        edContaContabilDDEST.Text := qry.FieldByName('PLACONTADDEST').AsString;
        qryContaContabilDDest.Locate('PLACONTA', qry.FieldByName('PLACONTADDEST').AsString, [loCaseInsensitive]);
     end;
     

     if qry.FieldByName('CODCENTROCUSTOC').AsString <> ''
     then begin
        qryCCustoC.Locate('CODCENTROCUSTO', qry.FieldByName('CODCENTROCUSTOC').AsString, [loCaseInsensitive]);
        cmbCCustoC.Text := qryCCustoC.FieldByName('NOME').AsString;
        cmbCCustoC.PerformSearch;
     end;

     if qry.FieldByName('CODCENTROCUSTOD').AsString <> ''
     then begin
        qryCCustoD.Locate('CODCENTROCUSTO', qry.FieldByName('CODCENTROCUSTOD').AsString, [loCaseInsensitive]);
        cmbCCustoD.Text := qryCCustoD.FieldByName('NOME').AsString;
        cmbCCustoD.PerformSearch;
     end;

     if qry.FieldByName('UNIDNEGOC').AsString <> ''
     then begin
        qryAtividade.Locate('UNIDNEGOC', qry.FieldByName('UNIDNEGOC').AsString, [loCaseInsensitive]);
        lkcmbDescAtividade.Text := qryAtividade.FieldByName('NOME').AsString;
        lkcmbDescAtividade.PerformSearch;
     end;

     if qry.FieldByName('CODSUBCONTA').AsString <> ''
     then begin
        qrySubConta.Locate('CODSUBCONTA', qry.FieldByName('CODSUBCONTA').AsString, [loCaseInsensitive]);
        dblkSubconta.Text := qrySubConta.FieldByName('NOMESUBCONTA').AsString;
        cmbCCustoD.PerformSearch;
     end;


     bbtnConfirmar.enabled := True;
     bbtnCancelar.enabled := True;

     pnlgrid.Visible := False;
     pnlop.visible := True;
     bInseri := False;
  end;

  sbtnAlterar.Down := False;
end;

procedure  TfrmCadMovReservaTree.PegaIdBenef;
begin

   evento := '';
   beneficio := '';

   try
      if trvEventosBenef.Items[trvEventosBenef.Selected.Absoluteindex].ImageIndex  =0 then
      begin
         
         evento := trvEventosBenef.Items.Item[trvEventosBenef.Selected.Absoluteindex].Text;

         qryEvento.close;
         qryEvento.sql.clear;
         qryEvento.sql.add(' SELECT IDEVENTOGERADOR FROM EVENTOGERADOR WHERE NOME LIKE ''%'+evento+'%'' ');
         qryEvento.Open;

         sidevento := qryEvento.FieldByName('IDEVENTOGERADOR').AsString;
         sidbeneficio := '';
      end
      else
      begin
         
         beneficio := trvEventosBenef.Items.Item[trvEventosBenef.Selected.Absoluteindex].Text;

         qrybeneficio.close;
         qrybeneficio.sql.clear;
         qrybeneficio.sql.add(' SELECT IDBENEFICIO, IDEVENTOGERADOR FROM BENEFICIO WHERE RTRIM(NOME) LIKE '''+trim(beneficio)+'''');
         qrybeneficio.Open;

         sidevento := qrybeneficio.FieldByName('IDEVENTOGERADOR').AsString;
         sidbeneficio := qrybeneficio.FieldByName('IDBENEFICIO').AsString;
      end;
   except
      
      if trvEventosBenef.Items[0].ImageIndex  =0 then
      begin
         
         evento := trvEventosBenef.Items.Item[0].Text;

         qryEvento.close;
         qryEvento.sql.clear;
         qryEvento.sql.add(' SELECT IDEVENTOGERADOR FROM EVENTOGERADOR WHERE NOME LIKE ''%'+evento+'%'' ');
         qryEvento.Open;

         sidevento := qryEvento.FieldByName('IDEVENTOGERADOR').AsString;
         sidbeneficio := '';
      end
      else
      begin
         
         beneficio := trvEventosBenef.Items.Item[0].Text;

         qrybeneficio.close;
         qrybeneficio.sql.clear;
         qrybeneficio.sql.add(' SELECT IDBENEFICIO, IDEVENTOGERADOR FROM BENEFICIO WHERE NOME LIKE ''%'+beneficio+'%'' ');
         qrybeneficio.Open;

         sidevento := qrybeneficio.FieldByName('IDEVENTOGERADOR').AsString;
         sidbeneficio := qrybeneficio.FieldByName('IDBENEFICIO').AsString;
      end;
   end;
end;

procedure  TfrmCadMovReservaTree.TrazDados;
begin

   PegaIdBenef;

   
   qry.close;
   qry.sql.clear;
   qry.sql.add(' SELECT DISTINCT EVEN.NOME EVENTO, '+
      '          B.NOME BENEF, '+
      '          PATROORIG.NOME PATROORIG, '+
      '          PLANOORIG.NOME PLANOORIG, '+
      '          RESERVAORIG.NOME RESERVAORIG, '+
      '          PATRODEST.NOME PATRODEST, '+
      '          PLANODEST.NOME PLANODEST, '+
      '          RESERVADEST.NOME RESERVADEST, '+
      '          R.NOMEREGRA REGRACALC, '+
      '          REGRAVAL.NOMEREGRA, '+
      
      '          REGRAZERA.NOMEREGRA AS REGRAZERA, '+
     
      '          MOV.SEQMOV,MOV.IDMOVIMENTO, '+
      '          B.IDBENEFICIO, EVEN.IDEVENTOGERADOR, '+
      '          R.IDREGRA, MOV.IDPATROORIG,                           '+
      '          MOV.IDPATRODEST, MOV.IDTIPORESERVAORIG, MOV.IDTIPORESERVADEST,    '+
      '          MOV.IDPLANOPREVORIG, MOV.IDPLANOPREVDEST, MOV.IDREGRAVALIDACAO,   '+
      
      '          MOV.IDREGRAZERAVALOR, '+
     
      '          MOV.FLGCONTABILIZA, '+
      '          MOV.PLANO,          '+
      '          MOV.PLACONTAC,      '+
      '          MOV.PLACONTAD,      '+
      '          MOV.CODCENTROCUSTOC,'+
      '          MOV.CODCENTROCUSTOD,'+
      '          MOV.UNIDNEGOC,      '+
      '          MOV.CODSUBCONTA,    '+
      '          MOV.IDREGRARETORNO,   '+ 
      '          MOV.PLACONTADDEST, MOV.PLACONTACDEST '+
      ' FROM     BENEFICIO B,EVENTOGERADOR EVEN,PLANPREV PLANOORIG,PLANPREV PLANODEST,PESSOA PATROORIG, '+
      '          PESSOA PATRODEST,RESERVAXPLANO RESERVAORIG,RESERVAXPLANO RESERVADEST,REGRA R, '+
      '          MOVRESERVA MOV,REGRA REGRAVAL, REGRA REGRAZERA        '+
      ' WHERE    MOV.IDBENEFICIO       = B.IDBENEFICIO(+)              '+
      ' AND      MOV.IDEVENTOGERADOR   = EVEN.IDEVENTOGERADOR          '+
      ' AND      MOV.IDPLANOPREVORIG   = PLANOORIG.IDPLANOPREV(+)      '+
      ' AND      MOV.IDPATROORIG       = PATROORIG.IDPESSOA(+)         '+
      ' AND      MOV.IDPLANOPREVDEST   = PLANODEST.IDPLANOPREV(+)      '+
      ' AND      MOV.IDPATRODEST       = PATRODEST.IDPESSOA(+)         '+
      ' AND      MOV.IDREGRA           = R.IDREGRA(+)                  '+
      ' AND      MOV.IDREGRAVALIDACAO  = REGRAVAL.IDREGRA(+)           '+
      
      ' AND      MOV.IDREGRAZERAVALOR  = REGRAZERA.IDREGRA(+)          '+
      
      ' AND      MOV.IDTIPORESERVADEST = RESERVADEST.IDTIPORESERVA(+)  '+
      ' AND      MOV.IDPLANOPREVDEST   = RESERVADEST.IDPLANOPREV(+)    '+
      ' AND      MOV.IDTIPORESERVAORIG = RESERVAORIG.IDTIPORESERVA(+)  '+
      ' AND      MOV.IDPLANOPREVORIG   = RESERVAORIG.IDPLANOPREV(+)    '+
      ' AND      MOV.IDEVENTOGERADOR   = '+sidevento+' ');

   if sidbeneficio <> '' then  qry.sql.add(' AND B.IDBENEFICIO = '+sidbeneficio+'');

   qry.sql.add(' ORDER BY MOV.SEQMOV ');
   qry.Open;

end;

procedure TfrmCadMovReservaTree.trvEventosBenefChange(Sender: TObject;
  Node: TTreeNode);
begin
  inherited;
   if (not  pnlgrid.visible) and (not binseri) then
   begin
      pnlgrid.Visible := True;
      pnlop.visible := False;
      bbtnConfirmar.enabled := True;
      bbtnCancelar.enabled := True;
   end;

   TrazDados;
   qrypatroorig.close;
   qrypatrodest.close;

   
   If  sidbeneficio <> '' Then
     qrypatroorig.parambyname('IDBENEFICIO').AsString := sidbeneficio
   else
     qrypatroorig.parambyname('IDBENEFICIO').AsInteger := -1;

   qrypatroorig.Open;
   if not binseri then cmbpatroorig.text := qrypatroorig.FieldByName('NOME').AsString
   else cmbpatroorig.text := '';

    
   If  sidbeneficio <> '' Then
     qrypatrodest.parambyname('IDBENEFICIO').AsString := sidbeneficio
   else
     qrypatrodest.parambyname('IDBENEFICIO').AsInteger := -1;
     
   qrypatrodest.Open;
   if not binseri then cmbpatrodest.text := qrypatrodest.FieldByName('NOME').AsString
   else cmbpatrodest.text := '';
end;

procedure TfrmCadMovReservaTree.sbtnApagarClick(Sender: TObject);
begin
  inherited;
  if not qry.isempty then
  begin
     if not  dtmBasedados.dbBaseDados.InTransaction then
     dtmBasedados.dbBaseDados.StartTransaction;


     if MsgDlg('Deseja realmente excluir este registro?','Exclusão', mtConfirmation, [mbyes,mbno],0) = mryes then
     begin
        qryaux.close;
        qryaux.sql.clear;
        qryaux.sql.add(' DELETE FROM MOVRESERVA WHERE IDMOVIMENTO = '+qry.FieldByName('IDMOVIMENTO').AsString+'');
        try
        qryaux.Execsql;
        except
           MsgDlg('Não foi possível excluir este registro?','Exclusão', mtError, [mbok],0);
        end;
        bbtnConfirmar.enabled := True;
        bbtnCancelar.enabled := True;
        TrazDados;
     end;
  end;

  sbtnApagar.Down := False;

end;

procedure TfrmCadMovReservaTree.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;

    
    Try
      If Not Sistema.GravaLogOperacoes(Self.Caption) Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;

  dtmBasedados.dbBaseDados.commit;
  if (not  pnlgrid.visible) then
  begin
     pnlgrid.Visible := True;
     pnlop.visible := False;
  end;
  TrazDados;
  bbtnConfirmar.enabled := False;
  bbtnCancelar.enabled := False;
end;

procedure TfrmCadMovReservaTree.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if  dtmBasedados.dbBaseDados.InTransaction then dtmBasedados.dbBaseDados.rollback;
  if (not  pnlgrid.visible) then
  begin
     pnlgrid.Visible := True;
     pnlop.visible := False;
  end;
  TrazDados;
  bbtnConfirmar.enabled := False;
  bbtnCancelar.enabled := False;
end;

procedure TfrmCadMovReservaTree.bbtnSairClick(Sender: TObject);
begin
  if  dtmBasedados.dbBaseDados.InTransaction then
  begin
     if MsgDlg('Algumas informações ainda não foram gravadas, deseja grava-las antes de sair?','Confirmação de Saída', mtConfirmation, [mbyes,mbno],0) = mryes then
     dtmBasedados.dbBaseDados.commit
     else  dtmBasedados.dbBaseDados.rollback;
  end;
  inherited;

end;

procedure TfrmCadMovReservaTree.sbtncopiaClick(Sender: TObject);
begin
  inherited;
if cmbpatroorig.text <> '' then
begin
   qrypatrodest.Locate('IDPESSOA',qrypatroorig.FieldByName('IDPESSOA').AsInteger,[locaseinsensitive]);
   cmbpatrodest.text := qrypatroorig.FieldByName('NOME').AsString;
end;
if cmbplanoorig.text <> '' then
begin
   qryplanodest.Locate('IDPLANOPREV',qryplanoorig.FieldByName('IDPLANOPREV').AsInteger,[locaseinsensitive]);
   cmbplanodest.text := qryplanoorig.FieldByName('NOME').AsString;
end;

   cmbreservadest.text := '';
end;

procedure TfrmCadMovReservaTree.btncopiadestClick(Sender: TObject);
begin
  inherited;

  if cmbpatrodest.text <> '' then
  begin
     qrypatroorig.Locate('IDPESSOA',qrypatrodest.FieldByName('IDPESSOA').AsInteger,[locaseinsensitive]);
     cmbpatroorig.text := qrypatrodest.FieldByName('NOME').AsString;
  end;
  if cmbplanodest.text <> '' then
  begin
     qryplanoorig.Locate('IDPLANOPREV',qryplanodest.FieldByName('IDPLANOPREV').AsInteger,[locaseinsensitive]);
     cmbplanoorig.text := qryplanodest.FieldByName('NOME').AsString;
  end;

     cmbreservaorig.text := '';
  end;

  procedure TfrmCadMovReservaTree.bbtnCancelarDetClick(Sender: TObject);
  begin
    inherited;
    pnlgrid.Visible := True;
    pnlop.visible := False;
    bbtnConfirmar.enabled := True;
    bbtnCancelar.enabled := True;

    TrazDados;
  end;

procedure TfrmCadMovReservaTree.bbtnOkDetClick(Sender: TObject);
begin
  inherited;


  if ((qryreservaorig.FieldByName('IDTIPORESERVA').AsInteger)  =
     (qryreservadest.FieldByName('IDTIPORESERVA').AsInteger)) and
     ((cmbreservaorig.text <> '') and (cmbreservadest.text <> '')) then
  begin
     MsgDlg('Reserva Origem e Reserva destino não podem ser a mesma.','Erro',mtError,[mbOk],0);
     exit;
  end;



  if not(OpcoesOk) then Exit;

  
  if chkContabiliza.Checked then if not(VerificaContas) then Exit;

  if bInseri
  then begin
     qryaux.close;
     qryaux.sql.clear;
     qryaux.sql.add(' SELECT IDMOVIMENTO FROM MOVRESERVA WHERE '+
                     ' IDEVENTOGERADOR = :idevento '+
                     ' AND IDPATROORIG = :idpatroorig '+
                     ' AND IDPATRODEST =  :idpatrodest '+
                     ' AND IDPLANOPREVORIG = :idplanoorig '+
                     ' AND IDPLANOPREVDEST = :idplanodest '+
                     ' AND IDTIPORESERVAORIG = :idreservaorig '+
                     ' AND IDTIPORESERVADEST = :idreservadest ');

     if sidbeneficio <> ''
     then qryaux.sql.add(' AND IDBENEFICIO = '+sidbeneficio+'');


     qryaux.parambyname('idevento').AsString := sidevento;
     qryaux.parambyname('idpatroorig').AsString := qrypatroorig.FieldByName('idpessoa').AsString;
     qryaux.parambyname('idpatrodest').AsString := qrypatrodest.FieldByName('idpessoa').AsString;
     qryaux.parambyname('idplanoorig').AsString := qryplanoorig.FieldByName('idplanoprev').AsString;
     qryaux.parambyname('idplanodest').AsString := qryplanodest.FieldByName('idplanoprev').AsString;
     qryaux.parambyname('idreservaorig').AsString := qryreservaorig.FieldByName('idtiporeserva').AsString;
     qryaux.parambyname('idreservadest').AsString := qryreservadest.FieldByName('idtiporeserva').AsString;
     qryaux.Open;

     if not qryaux.IsEmpty
     then begin
        MsgDlg('Já existe um Padrão de Transferência de Reservas cadastrado com os mesmos parâmetros.','Erro',mtError,[mbOk],0);
        Exit;
     end;

     with qryInsert do
     begin
         parambyname('idmov').AsInteger :=  leultregistro(nil,'MOVRESERVA');
         parambyname('idevento').AsString := sidevento;
         parambyname('idpatroorig').AsString := qrypatroorig.FieldByName('idpessoa').AsString;

         if  cmbpatrodest.Text <> ''
         then parambyname('idpatrodest').AsString := qrypatrodest.FieldByName('idpessoa').AsString
         else parambyname('idpatrodest').clear;

         if cmbplanodest.text <> ''
         then parambyname('idplanodest').AsString := qryplanodest.FieldByName('idplanoprev').AsString
         else parambyname('idplanodest').Clear;

         if cmbreservadest.text <> ''
         then parambyname('idreservadest').AsString := qryreservadest.FieldByName('idtiporeserva').AsString
         else parambyname('idreservadest').clear;

         parambyname('idplanoorig').AsString := qryplanoorig.FieldByName('idplanoprev').AsString;


         parambyname('idreservaorig').AsString := qryreservaorig.FieldByName('idtiporeserva').AsString;


         if sidbeneficio <> ''
         then parambyname('idbeneficio').AsString := sidbeneficio
         else parambyname('idbeneficio').Clear;

         if trim(dbredseqnum.text) <> ''
         then parambyname('seqmov').AsString :=  trim(dbredseqnum.text)
         else parambyname('seqmov').AsString :=  '0';

         if cmbregra.text <> ''
         then parambyname('idregra').AsString := qryregra.FieldByName('idregra').AsString
         else parambyname('idregra').Clear;

         if cmbregraval.text <> ''
         then parambyname('idregravalidacao').AsString := qryregraval.FieldByName('idregra').AsString
         else parambyname('idregravalidacao').Clear;

         
         if cmbregrazera.text <> ''
         then parambyname('idregrazeravalor').AsString := qryregrazera.FieldByName('idregra').AsString
         else parambyname('idregrazeravalor').Clear;

         
         if dblkpcmbRegraRetorno.text <> ''
         
         
         then parambyname('IDREGRARETORNO').AsString := qryRegraRetorno.FieldByName('IDREGRA').AsString
         
         else parambyname('IDREGRARETORNO').Clear;


         if chkContabiliza.Checked then
         begin
           ParamByName('FLGCONTABILIZA').AsString := '1';
           ParamByName('PLANO').AsString            := IntToStr(IntegraBack.Plano);
           ParamByName('PLACONTAC').AsString        := edContaContabilC.Text;
           ParamByName('PLACONTAD').AsString        := edContaContabilD.Text;
           ParamByName('PLACONTACDEST').AsString    := edContaContabilCDEST.Text;
           ParamByName('PLACONTADDEST').AsString    := edContaContabilDDEST.Text;

           if trim(cmbCCustoC.Text) <> ''
           then ParamByName('CODCENTROCUSTOC').AsString  := qryCCustoC.FieldByName('CODCENTROCUSTO').AsString
           else ParamByName('CODCENTROCUSTOC').Clear;

           if trim(cmbCCustoD.Text) <> ''
           then ParamByName('CODCENTROCUSTOD').AsString  := qryCCustoD.FieldByName('CODCENTROCUSTO').AsString
           else ParamByName('CODCENTROCUSTOD').Clear;

           if (trim(cmbCCustoC.Text) <> '') or (trim(cmbCCustoD.Text) <> '')
           then ParamByName('IDEMPRESA').AsString        := IntToStr(Sistema.IdEmpresa)
           else ParamByName('IDEMPRESA').Clear;

           if trim(lkcmbDescAtividade.Text) <> ''
           then ParamByName('UNIDNEGOC').AsString        := qryAtividade.FieldByName('UNIDNEGOC').AsString
           else ParamByName('UNIDNEGOC').Clear;

           if trim(dblkSubconta.Text) <> ''
           then ParamByName('CODSUBCONTA').AsString      := qrySubConta.FieldByName('CODSUBCONTA').AsString
           else ParamByName('CODSUBCONTA').Clear;
         end
         else begin
            ParamByName('FLGCONTABILIZA').AsString        := '0';
            ParamByName('PLANO').Clear;
            ParamByName('PLACONTAC').Clear;
            ParamByName('PLACONTAD').Clear;
            ParamByName('PLACONTACDEST').Clear;
            ParamByName('PLACONTADDEST').Clear;
            ParamByName('CODCENTROCUSTOC').Clear;
            ParamByName('CODCENTROCUSTOD').Clear;
            ParamByName('UNIDNEGOC').Clear;
            ParamByName('CODSUBCONTA').Clear;
            ParamByName('IDEMPRESA').Clear;
         end;
         try
            ExecSQL;
         except
            on E:EDBEngineError do
            begin
               MostrarErro(E);
               Exit;
            end;
         end;
     end 
  end 
  else begin 
     with qryEdit do
     begin
         parambyname('IDMOVIMENTO').AsString := qry.FieldByName('IDMOVIMENTO').AsString;
         parambyname('idevento').AsString := sidevento;
         parambyname('idpatroorig').AsString := qrypatroorig.FieldByName('idpessoa').AsString;
         parambyname('idplanoorig').AsString := qryplanoorig.FieldByName('idplanoprev').AsString;
         parambyname('idreservaorig').AsString := qryreservaorig.FieldByName('idtiporeserva').AsString;

         if  cmbpatrodest.Text <> ''
         then parambyname('idpatrodest').AsString := qrypatrodest.FieldByName('idpessoa').AsString
         else parambyname('idpatrodest').clear;

         if cmbplanodest.text <> ''
         then parambyname('idplanodest').AsString := qryplanodest.FieldByName('idplanoprev').AsString
         else parambyname('idplanodest').Clear;

         if cmbreservadest.text <> ''
         then parambyname('idreservadest').AsString := qryreservadest.FieldByName('idtiporeserva').AsString
         else parambyname('idreservadest').clear;

        if sidbeneficio <> ''
        then parambyname('idbeneficio').AsString := sidbeneficio
        else parambyname('idbeneficio').Clear;

        if trim(dbredseqnum.text) <> ''
        then parambyname('seqmov').AsString :=  trim(dbredseqnum.text)
        else parambyname('seqmov').AsString :=  '0';

        if cmbregra.text <> ''
        then parambyname('idregra').AsString := qryregra.FieldByName('idregra').AsString
        else parambyname('idregra').Clear;

        if cmbregraval.text <> ''
        then parambyname('idregravalidacao').AsString := qryregraval.FieldByName('idregra').AsString
        else parambyname('idregravalidacao').Clear;

        
        if cmbregrazera.text <> ''
        then parambyname('idregrazeravalor').AsString := qryregrazera.FieldByName('idregra').AsString
        else parambyname('idregrazeravalor').Clear;

        
        if dblkpcmbRegraRetorno.text <> ''
        then parambyname('IDREGRARETORNO').AsString := qryRegraRetorno.FieldByName('idregra').AsString
        else parambyname('IDREGRARETORNO').Clear;

        if chkContabiliza.Checked
        then begin
           ParamByName('FLGCONTABILIZA').AsString := '1';
           ParamByName('PLANO').AsString            := IntToStr(IntegraBack.Plano);
           ParamByName('PLACONTAC').AsString        := edContaContabilC.Text;
           ParamByName('PLACONTAD').AsString        := edContaContabilD.Text;
           ParamByName('PLACONTACDEST').AsString    := edContaContabilCDEST.Text;
           ParamByName('PLACONTADDEST').AsString    := edContaContabilDDEST.Text;
           if trim(cmbCCustoC.Text) <> ''
           then ParamByName('CODCENTROCUSTOC').AsString  := qryCCustoC.FieldByName('CODCENTROCUSTO').AsString
           else ParamByName('CODCENTROCUSTOC').AsString  := '';

           if trim(cmbCCustoD.Text) <> ''
           then ParamByName('CODCENTROCUSTOD').AsString  := qryCCustoD.FieldByName('CODCENTROCUSTO').AsString
           else ParamByName('CODCENTROCUSTOD').AsString  := '';


           if (trim(cmbCCustoC.Text) <> '') or (trim(cmbCCustoD.Text) <> '')
           then ParamByName('IDEMPRESA').AsString        := IntToStr(Sistema.IdEmpresa)
           else ParamByName('IDEMPRESA').AsString        := '';

           if trim(lkcmbDescAtividade.Text) <> ''
           then ParamByName('UNIDNEGOC').AsString        := qryAtividade.FieldByName('UNIDNEGOC').AsString
           else ParamByName('UNIDNEGOC').AsString        := '';

           if trim(dblkSubconta.Text) <> ''
           then ParamByName('CODSUBCONTA').AsString      := qrySubConta.FieldByName('CODSUBCONTA').AsString
           else ParamByName('CODSUBCONTA').AsString      := '';
        end
        else begin
           ParamByName('FLGCONTABILIZA').AsString        := '0';
           ParamByName('PLANO').Clear;
           ParamByName('PLACONTAC').AsString             := '';
           ParamByName('PLACONTAD').AsString             := '';
           ParamByName('PLACONTACDEST').AsString             := '';
           ParamByName('PLACONTADDEST').AsString             := '';
           ParamByName('CODCENTROCUSTOC').AsString       := '';
           ParamByName('CODCENTROCUSTOD').AsString       := '';
           ParamByName('UNIDNEGOC').Clear;
           ParamByName('CODSUBCONTA').Clear;
           ParamByName('IDEMPRESA').Clear;
        end;

        try
          ExecSQL;
        except
          MsgDlg('Erro na Atualização do Padrão de Transferência de Reservas.','Erro',mtError,[mbOk],0);
          Exit;
        end;
     end; // with qryEdit
     pnlgrid.Visible := True;
     pnlop.visible := False;
     TrazDados;
     bbtnConfirmar.enabled := True;
     bbtnCancelar.enabled := True;
  end;


  cmbpatrodest.Text := '';
  cmbplanodest.text := '';
  cmbreservadest.text := '';
  cmbpatroorig.text := '';
  cmbplanoorig.text := '';
  cmbreservaorig.text := '';
  cmbregra.Text := '';
  cmbregraval.Text := '';
  dbredseqnum.Text := '';
end;

function TfrmCadMovReservaTree.OpcoesOk : boolean;
var sIncompl : String;
begin
   Result := False;
   sIncompl := '';

   if  cmbpatroorig.text  = ''
   then begin
      if sIncompl = ''
      then sIncompl := 'Patrocinadora de Origem '
      else sIncompl := sIncompl +', Patrocinadora de Origem ';
   end;

   if  dbredseqnum.text  = ''
   then begin
      if sIncompl = ''
      then sIncompl := 'Sequência de Cálculo '
      else sIncompl := sIncompl +', Sequência de Cálculo ';
   end;

   if  cmbplanoorig.text  = ''
   then begin
      if sIncompl = ''
      then sIncompl := 'Plano Previdenciário de Origem '
      else sIncompl := sIncompl +', Plano Previdenciário de Origem ';
   end;

   if  cmbreservaorig.text  = ''
   then begin
      if sIncompl = ''
      then sIncompl := 'Reserva de Origem '
      else sIncompl := sIncompl +', Reserva de Origem ';
   end;

   if sIncompl <> '' then
   begin
      sIncompl := 'Campos não preenchidos ==> '+sIncompl;
      MsgDlg(sIncompl,'Erro',mtError,[mbOk],0);
      exit;
   end
   else   Result := True;
end;

procedure TfrmCadMovReservaTree.qryplanoorigAfterScroll(DataSet: TDataSet);
begin
  inherited;
  qryreservaorig.close;
  qryreservaorig.parambyname('IDPLANOPREV').AsInteger := qryplanoorig.FieldByName('IDPLANOPREV').AsInteger;
  qryreservaorig.Open;
  if not binseri
  then cmbreservaorig.Text := qryreservaorig.FieldByName('NOME').AsString
  else cmbreservaorig.text := '';
end;

procedure TfrmCadMovReservaTree.qryplanodestAfterScroll(DataSet: TDataSet);
begin
  inherited;
  qryreservadest.close;
  qryreservadest.parambyname('IDPLANOPREV').AsInteger := qryplanodest.FieldByName('IDPLANOPREV').AsInteger;
  qryreservadest.Open;
  if not binseri
  then cmbreservadest.Text := qryreservadest.FieldByName('NOME').AsString
  else cmbreservadest.text := '';
end;

procedure TfrmCadMovReservaTree.qrypatroorigAfterScroll(DataSet: TDataSet);
begin
  inherited;
  qryplanoorig.close;
  qryplanoorig.parambyname('IDPESSJUR').AsInteger := qrypatroorig.FieldByName('IDPESSOA').AsInteger;
  qryplanoorig.Open;
  if not binseri
  then cmbplanoorig.text := qryplanoorig.FieldByName('NOME').AsString
  else cmbplanoorig.text := '';
end;

procedure TfrmCadMovReservaTree.qrypatrodestAfterScroll(DataSet: TDataSet);
begin
  inherited;
  qryplanodest.close;
  qryplanodest.parambyname('IDPESSJUR').AsInteger := qrypatrodest.FieldByName('IDPESSOA').AsInteger;
  qryplanodest.Open;
  if not binseri
  then cmbplanodest.text := qryplanodest.FieldByName('NOME').AsString
  else cmbplanodest.text := '';

end;

procedure TfrmCadMovReservaTree.cmbpatroorigCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  qryplanoorig.close;
  qryplanoorig.parambyname('IDPESSJUR').AsInteger := qrypatroorig.FieldByName('IDPESSOA').AsInteger;
  qryplanoorig.Open;
  if not binseri
  then cmbplanoorig.text := qryplanoorig.FieldByName('NOME').AsString
  else cmbplanoorig.text := '';
end;

procedure TfrmCadMovReservaTree.cmbpatrodestCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  qryplanodest.close;
  qryplanodest.parambyname('IDPESSJUR').AsInteger := qrypatrodest.FieldByName('IDPESSOA').AsInteger;
  qryplanodest.Open;
  if not binseri
  then cmbplanodest.text := qryplanodest.FieldByName('NOME').AsString
  else cmbplanodest.text := '';
end;

procedure TfrmCadMovReservaTree.cmbplanoorigCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  qryreservaorig.close;
  qryreservaorig.parambyname('IDPLANOPREV').AsInteger := qryplanoorig.FieldByName('IDPLANOPREV').AsInteger;
  qryreservaorig.Open;
  if not binseri
  then cmbreservaorig.Text := qryreservaorig.FieldByName('NOME').AsString
  else cmbreservaorig.text := '';

end;

procedure TfrmCadMovReservaTree.cmbplanodestCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  qryreservadest.close;
  qryreservadest.parambyname('IDPLANOPREV').AsInteger := qryplanodest.FieldByName('IDPLANOPREV').AsInteger;
  qryreservadest.Open;
  if not binseri
  then cmbreservadest.Text := qryreservadest.FieldByName('NOME').AsString
  else cmbreservadest.text := '';
end;

procedure TfrmCadMovReservaTree.chkContabilizaClick(Sender: TObject);
begin
  inherited;
  if chkContabiliza.Checked
  then tbsContabiliza.TabVisible := True
  else tbsContabiliza.TabVisible := False;
end;

procedure TfrmCadMovReservaTree.spdContaContabilDClick(Sender: TObject);
begin
  inherited;
  treeContaContabilD.Top     := 53;
  treeContaContabilD.Left    := 3;
  treeContaContabilD.Visible := not treeContaContabilD.Visible;
  treeContaContabilD.Height  := 170;
  treeContaContabilD.Width   := 250;
  if treeContaContabilD.Visible
  then begin
     treeContaContabilD.SetFocus;
     treeContaContabilD.BringToFront;
  end;

end;

procedure TfrmCadMovReservaTree.spdContaContabilCClick(Sender: TObject);
begin
  inherited;
  treeContaContabilC.Top     := 56;
  treeContaContabilC.Left    := 258;
  treeContaContabilC.Visible := not treeContaContabilC.Visible;
  treeContaContabilC.Height  := 170;
  treeContaContabilC.Width   := 250;
  if treeContaContabilC.Visible
  then begin
     treeContaContabilC.SetFocus;
     treeContaContabilC.BringToFront;
  end;


end;

procedure TfrmCadMovReservaTree.edContaContabilDExit(Sender: TObject);
begin
  inherited;

  try
    cmbCCustoD.Text    := '';
    cmbCCustoD.Enabled := False;
    // Posicionar a Query PlanoConta na conta certa
    if (trim(edContaContabilD.Text) <> '') and (qryContaContabilD.Active)
    then begin
       if (qryContaContabilD.LOCATE('PLACONTA', edContaContabilD.Text,[loCaseInsensitive,loPartialKey]))
       then begin
          if (qryContaContabilD.FieldByName('PLATIPO').AsString = 'A')
          then begin
            lbDescricaoContaD.Caption := qryContaContabilD.FieldByName('PLANOME').AsString;
            qryCCustoD.Close;
            qryCCustoD.ParamByName('IDEMPRESA').AsInteger := Sistema.IdEmpresa;
            qryCCustoD.ParamByName('PLANO').AsInteger     := IntegraBack.Plano;
            qryCCustoD.ParamByName('PLACONTA').AsString   := edContaContabilD.Text;
            qryCCustoD.Open;
            if not qryCCustoD.IsEmpty
            then cmbCCustoD.Enabled := True
            else cmbCCustoD.Enabled := False;
          end
          else begin
              MsgDlg('Conta contábil tem que ser analítica','Erro',mtError,[mbOK],0);
              edContaContabilD.Text := '';
              edContaContabilD.SetFocus;
          end
       end
       else begin
          MsgDlg('Conta contábil não cadastrada','Erro',mtError,[mbOK],0);
          edContaContabilD.Text := '';
          edContaContabilD.SetFocus;
       end;
    end;
  except
    raise;
  end;
end;

procedure TfrmCadMovReservaTree.treeContaContabilDDblClick(
  Sender: TObject);
begin
  inherited;
  if (qryContaContabilD.FieldByName('PLATIPO').AsString = 'A')
  then treeContaContabilDExit(treeContaContabilD)
  else Exit;

end;

procedure TfrmCadMovReservaTree.treeContaContabilDExit(Sender: TObject);
begin
  inherited;
  treeContaContabilD.Visible := False;
  if (qryContaContabilD.FieldByName('PLATIPO').AsString = 'A')
  then begin
     edContaContabilD.Text := '';
     edContaContabilD.Text := treeContaContabilD.ValorChave;
     lbDescricaoContaD.Caption := qryContaContabilD.FieldByName('PLANOME').AsString;
  end;
end;



procedure TfrmCadMovReservaTree.treeContaContabilCDblClick(Sender: TObject);
begin
  inherited;
  if (qryContaContabilC.FieldByName('PLATIPO').AsString = 'A')
  then treeContaContabilCExit(treeContaContabilC)
  else Exit;
end;



procedure TfrmCadMovReservaTree.treeContaContabilCExit(Sender: TObject);
begin
  inherited;
  treeContaContabilC.Visible := False;
  if (qryContaContabilC.FieldByName('PLATIPO').AsString = 'A')
  then begin
     edContaContabilC.Text := '';
     edContaContabilC.Text := treeContaContabilC.ValorChave;
     lbDescricaoContaC.Caption := qryContaContabilC.FieldByName('PLANOME').AsString;
  end;
end;



procedure TfrmCadMovReservaTree.edContaContabilCExit(Sender: TObject);
begin
  inherited;
  try
    cmbCCustoC.Text    := '';
    cmbCCustoC.Enabled := False;
    // Posicionar a Query PlanoConta na conta certa
    if (trim(edContaContabilC.Text) <> '') and (qryContaContabilC.Active)
    then begin
       if (qryContaContabilC.LOCATE('PLACONTA', edContaContabilC.Text,[loCaseInsensitive,loPartialKey]))
       then begin
          if (qryContaContabilC.FieldByName('PLATIPO').AsString = 'A')
          then begin
            lbDescricaoContaC.Caption := qryContaContabilC.FieldByName('PLANOME').AsString;
            qryCCustoC.Close;
            qryCCustoC.ParamByName('IDEMPRESA').AsInteger := Sistema.IdEmpresa;
            qryCCustoC.ParamByName('PLANO').AsInteger     := IntegraBack.Plano;
            qryCCustoC.ParamByName('PLACONTA').AsString   := edContaContabilC.Text;
            qryCCustoC.Open;
            if not qryCCustoC.IsEmpty
            then cmbCCustoC.Enabled := True
            else cmbCCustoC.Enabled := False;
          end
          else begin
              MsgDlg('Conta contábil tem que ser analítica','Erro',mtError,[mbOK],0);
              edContaContabilC.Text := '';
              edContaContabilC.SetFocus;
          end
       end
       else begin
          MsgDlg('Conta contábil não cadastrada','Erro',mtError,[mbOK],0);
          edContaContabilC.Text := '';
          edContaContabilC.SetFocus;
       end;
    end;
  except
    raise;
  end;
end;



procedure TfrmCadMovReservaTree.spdContaContabilDDestClick(Sender: TObject);
begin
  inherited;
  treeContaContabilDDest.Top     := 155;
  treeContaContabilDDest.Left    := 3;
  treeContaContabilDDest.Visible := not treeContaContabilDDest.Visible;
  treeContaContabilDDest.Height  := 170;
  treeContaContabilDDest.Width   := 250;
  if treeContaContabilDDest.Visible
  then begin
     treeContaContabilDDest.SetFocus;
     treeContaContabilDDest.BringToFront;
  end;

end;



procedure TfrmCadMovReservaTree.spdContaContabilCDestClick(Sender: TObject);
begin
  inherited;
  treeContaContabilCDest.Top     := 155;
  treeContaContabilCDest.Left    := 258;
  treeContaContabilCDest.Visible := not treeContaContabilCDest.Visible;
  treeContaContabilCDest.Height  := 170;
  treeContaContabilCDest.Width   := 250;
  if treeContaContabilCDest.Visible
  then begin
     treeContaContabilCDest.SetFocus;
     treeContaContabilCDest.BringToFront;
  end;
end;



procedure TfrmCadMovReservaTree.edContaContabilDDestExit(Sender: TObject);
begin
  inherited;
  try
    // Posicionar a Query PlanoConta na conta certa
    if (trim(edContaContabilDDest.Text) <> '') and (qryContaContabilDDest.Active)
    then begin
       if (qryContaContabilDDest.LOCATE('PLACONTA', edContaContabilDDest.Text,[loCaseInsensitive,loPartialKey]))
       then begin
          if (qryContaContabilDDest.FieldByName('PLATIPO').AsString = 'A')
          then begin
            lbDescricaoContaDDest.Caption := qryContaContabilDDest.FieldByName('PLANOME').AsString;
          end
          else begin
              MsgDlg('Conta contábil tem que ser analítica','Erro',mtError,[mbOK],0);
              edContaContabilDDest.Text := '';
              edContaContabilDDest.SetFocus;
          end
       end
       else begin
          MsgDlg('Conta contábil não cadastrada','Erro',mtError,[mbOK],0);
          edContaContabilDDest.Text := '';
          edContaContabilDDest.SetFocus;
       end;
    end;
  except
    raise;
  end;
end;



procedure TfrmCadMovReservaTree.treeContaContabilDDestDblClick(Sender: TObject);
begin
  inherited;
  if (qryContaContabilDDest.FieldByName('PLATIPO').AsString = 'A')
  then treeContaContabilDDestExit(treeContaContabilDDest)
  else Exit;
end;



procedure TfrmCadMovReservaTree.treeContaContabilDDestExit(Sender: TObject);
begin
  inherited;
  treeContaContabilDDest.Visible := False;
  if (qryContaContabilDDest.FieldByName('PLATIPO').AsString = 'A')
  then begin
     edContaContabilDDest.Text := '';
     edContaContabilDDest.Text := treeContaContabilDDest.ValorChave;
     lbDescricaoContaDDest.Caption := qryContaContabilDDest.FieldByName('PLANOME').AsString;
  end;
end;



procedure TfrmCadMovReservaTree.treeContaContabilCDestDblClick(Sender: TObject);
begin
  inherited;
  if (qryContaContabilCDest.FieldByName('PLATIPO').AsString = 'A')
  then treeContaContabilCDestExit(treeContaContabilCDest)
  else Exit;
end;



procedure TfrmCadMovReservaTree.treeContaContabilCDestExit(Sender: TObject);
begin
  inherited;
  treeContaContabilCDest.Visible := False;
  if (qryContaContabilCDest.FieldByName('PLATIPO').AsString = 'A')
  then begin
     edContaContabilCDest.Text := '';
     edContaContabilCDest.Text := treeContaContabilCDest.ValorChave;
     lbDescricaoContaCDest.Caption := qryContaContabilCDest.FieldByName('PLANOME').AsString;
  end;
end;



procedure TfrmCadMovReservaTree.edContaContabilCDestExit(Sender: TObject);
begin
  inherited;
  try
    // Posicionar a Query PlanoConta na conta certa
    if (trim(edContaContabilCDest.Text) <> '') and (qryContaContabilCDest.Active)
    then begin
       if (qryContaContabilCDest.LOCATE('PLACONTA', edContaContabilCDest.Text,[loCaseInsensitive,loPartialKey]))
       then begin
          if (qryContaContabilCDest.FieldByName('PLATIPO').AsString = 'A')
          then begin
            lbDescricaoContaCDest.Caption := qryContaContabilCDest.FieldByName('PLANOME').AsString;
          end
          else begin
              MsgDlg('Conta contábil tem que ser analítica','Erro',mtError,[mbOK],0);
              edContaContabilCDest.Text := '';
              edContaContabilCDest.SetFocus;
          end
       end
       else begin
          MsgDlg('Conta contábil não cadastrada','Erro',mtError,[mbOK],0);
          edContaContabilCDest.Text := '';
          edContaContabilCDest.SetFocus;
       end;
    end;
  except
    raise;
  end;
end;



function TfrmCadMovReservaTree.VerificaContas: Boolean;
var
  sMsg          : String;
  sCentroCustoD : String;
  sCentroCustoC : String;
  iSubConta     : Integer;
begin
  Result := False;
  sMsg   := '';

  // -----------------------------------------------------------------------------------------------

  sCentroCustoD := '';
  if trim(cmbCCustoD.Text) <> '' then
    sCentroCustoD := qryCCustoD.FieldByName('CODCENTROCUSTO').AsString;

  sCentroCustoC := '';
  if trim(cmbCCustoC.Text) <> '' then
    sCentroCustoC := qryCCustoC.FieldByName('CODCENTROCUSTO').AsString;

  iSubConta := -1;
  if trim(dblkSubconta.Text) <> '' then
    iSubConta := qrySubConta.FieldByName('CODSUBCONTA').AsInteger;

  // -----------------------------------------------------------------------------------------------


  // Conta contábil de Débito - origem
  if not(VerificaContaContabil(edContaContabilD.Text, sCentroCustoD, iSubConta, IntegraBack.Plano, sMsg)) then
  begin
    MsgDlg('Favor verificar a Conta para Débito - Origem: ' + #13 + sMsg, 'AdmPrev', mtWarning, [mbOk], 0);
    Repaint;
    Exit;
  end;

  // Conta contábil de Crédito - origem
  if not(VerificaContaContabil(edContaContabilC.Text, sCentroCustoC, iSubConta, IntegraBack.Plano, sMsg)) then
  begin
    MsgDlg('Favor verificar a Conta para Crédito - Origem: ' + #13 + sMsg, 'AdmPrev', mtWarning, [mbOk], 0);
    Repaint;
    Exit;
  end;

  // Conta contábil de Débito - destino
  if not(VerificaContaContabil(edContaContabilDDEST.Text, sCentroCustoD, iSubConta, IntegraBack.Plano, sMsg)) then
  begin
    MsgDlg('Favor verificar a Conta para Débito - Destino: ' + #13 + sMsg, 'AdmPrev', mtWarning, [mbOk], 0);
    Repaint;
    Exit;
  end;

  // Conta contábil de Crédito - destino
  if not(VerificaContaContabil(edContaContabilCDEST.Text, sCentroCustoC, iSubConta, IntegraBack.Plano, sMsg)) then
  begin
    MsgDlg('Favor verificar a Conta para Crédito - Destino: ' + #13 + sMsg, 'AdmPrev', mtWarning, [mbOk], 0);
    Repaint;
    Exit;
  end;

  Result := True;
end;



function TfrmCadMovReservaTree.VerificaContaContabil(const psConta      : String;
                                                     const psCusto      : String;
                                                     const piSubConta   : Integer;
                                                     const piPlanoConta : Integer;
                                                     var   psMsg        : String
                                                    ): Boolean;
var
  sSQL : String;
begin
  Result  := False;
  psMsg   := '';

  sSQL :=
  'SELECT '                                         + #13 +
  '  PLAINATIVA, PLATIPO, PLASUBCONTA, PLACCUST '   + #13 +
  'FROM '                                           + #13 +
  '  PLANOCONTA '                                   + #13 +
  'WHERE '                                          + #13 +
  '      PLACONTA = ' + QuotedStr(psConta)          + #13 +
  '  AND PLANO    = ' + IntToStr(piPlanoConta);

  if FazQuery(qryAux, sSQL) then
  begin
    if qryAux.FieldByName('PLAINATIVA').AsString = 'S'  then psMsg := psMsg + 'CONTA INATIVA;';
    if qryAux.FieldByName('PLATIPO').AsString = 'S'     then psMsg := psMsg + 'CONTA SINTÉTICA;';

    if qryAux.FieldByName('PLASUBCONTA').AsString = 'S' then
      if piSubConta = -1 then
        psMsg := psMsg + 'SUBCONTA NECESSÁRIA AUSENTE;';

    if qryAux.FieldByName('PLACCUST').AsString = 'S' then
    begin
      if psCusto = '' then
      begin
        psMsg := psMsg + 'CENTROCUSTO NECESSÁRIO AUSENTE;';
      end
      else
      begin
        if not VerificaCentroCusto(psCusto) then psMsg := psMsg + 'CENTROCUSTO INATIVO;'
      end;
    end;
  end
  else
  begin
    psMsg := psMsg + 'CONTA NÃO CONSTA DO PLANO DE CONTAS VIGENTE;';
  end;

  Result := psMsg = '';
end;



function TfrmCadMovReservaTree.VerificaCentroCusto(const psCusto: String): Boolean;
var
  sSQL : String;
begin
  sSQL :=
  'SELECT '                                                 + #13 +
  '  CODCENTROCUSTO '                                       + #13 +
  'FROM '                                                   + #13 +
  '  CENTCUST '                                             + #13 +
  'WHERE '                                                  + #13 +
  '      CODCENTROCUSTO = ' + QuotedStr(psCusto)            + #13 +
  '  AND IDEMPRESA      = ' + IntToStr(Sistema.IDEmpresa)   + #13 +
  '  AND ATIVO          = ''S'' ';

  Result := FazQuery(qryAux, sSQL);
end;



end.

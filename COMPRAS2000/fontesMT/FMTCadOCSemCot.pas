unit FMTCadOCSemCot;
{
//------------------------------------------------------------------------------
//   Autor     : Augusto
//   Data      : 02/11/2007
//   Pendência : 24187
//   Descrição : Não permitir confirmar OC sem itens  
//------------------------------------------------------------------------------
**********************************************************************************
   Autor     : Rodolpho da Silva
   Data      : 03/05/2005
   Pendência : 18764
   Descrição : Não permitir que seja zerada o campo QTDEPENDENTE da tabela
               ITEMSOLI
**********************************************************************************
}



interface
// acertos gerais para compatibilização com fontes do Igor - FDias - 13.10.2003
//  OrdemCompra.GetItemOC( Sistema.IdEmpresa,NumOC ); inclusão de Sistema.IDEmpresa

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, Mask, DBCtrls,
  wwdbdatetimepicker, CMDateTimePicker, CMProcuraSubTipo, fcLabel, TREdit,
  wwdblook, CMDBLookupCombo,UCtrlArtigo, uCtrlUnMedida,uCtrlComprador,
  uCtrlOrdemCompra, uCtrlTipoAgregado, uCMTypes, uModulo;

type

   TGrupos = record
     sGrupo : string;
     fValor : extended;
   end;

   TPrazoEnt = Class(TObject)
   public
      QTDEENTREGA    : Double;
      PRAZOENTREGA   : Double;
      DATAENTREGA    : TDateTime;
      PARCELAENTREGA : Double;
   End;
   TPrazoPag = Class(TObject)
   public
      PERCPAGTO    : Double;
      PRAZOPGTO    : Double;
      DATAPAGTO    : TDateTime;
      PARCELAPGTO  : Double;
   End;


Type   
  TFrmMTCadOCSemCot = class(TFrmCadastroMestreDetMT)
    cmpForn: TCMProcuraForCli;
    Label2: TLabel;
    edDataOC: TCMDateTimePicker;
    Label13: TLabel;
    RgFrete: TDBRadioGroup;
    edContato: TDBEdit;
    cdsItemOC: TCMClientDataSet;
    cdsSCItemOC: TCMClientDataSet;
    cdsAgregItemOC: TCMClientDataSet;
    cdsPrazoPagOC: TCMClientDataSet;
    cdsPrazoEntOC: TCMClientDataSet;
    cdsAgreg: TCMClientDataSet;
    cdsArtigo: TCMClientDataSet;
    cdsUnidMed: TCMClientDataSet;
    plnArt: TPanel;
    LbArt: TfcLabel;
    ToolbarSep972: TToolbarSep97;
    btnCopiaPrazo: TToolbarButton97;
    Label7: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label4: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    dblcItem: TwwDBLookupCombo;
    dblcDesc: TwwDBLookupCombo;
    dblcUN: TwwDBLookupCombo;
    edQtdePed: TDBRealEdit;
    edPreco: TDBRealEdit;
    memObsItem: TDBMemo;
    TabPrazoEnt: TTabSheet;
    TabPrazoPag: TTabSheet;
    TabValAgreg: TTabSheet;
    TabOBS: TTabSheet;
    memObsOC: TDBMemo;
    plnPrazoEnt: TPanel;
    plnOpEnt: TPanel;
    btnAddPrazoEnt: TBitBtn;
    BtnDelPrazoEnt: TBitBtn;
    BtnLimpaEnt: TBitBtn;
    Label15: TLabel;
    Label16: TLabel;
    Label14: TLabel;
    Label3: TLabel;
    edQtdeEnt: TRealEdit;
    edPrazoEnt: TRealEdit;
    edDataEnt: TCMDateTimePicker;
    plnPrazoPag: TPanel;
    plnOpBar: TPanel;
    BtnAddPag: TBitBtn;
    btnDelPag: TBitBtn;
    BtnLimpaPag: TBitBtn;
    GrdPrazoPag: TwwDBGrid;
    Label22: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label19: TLabel;
    edPercPag: TRealEdit;
    edPrazoPag: TRealEdit;
    edDataPag: TCMDateTimePicker;
    plnAgreg: TPanel;
    PlnOPAgreg: TPanel;
    btnAddAgreg: TBitBtn;
    btnDelAgreg: TBitBtn;
    btnLimpaAgreg: TBitBtn;
    wwDBGrid1: TwwDBGrid;
    Label1: TLabel;
    Label11: TLabel;
    LbValPerc: TLabel;
    Label12: TLabel;
    dblcAgreg: TCMDBLookupCombo;
    edBase: TRealEdit;
    edAliquota: TRealEdit;
    edValor: TRealEdit;
    dsPrazoEntOC: TwwDataSource;
    dsPrazoPagOC: TwwDataSource;
    dsAgregItemOC: TwwDataSource;
    Label5: TLabel;
    edNumOC: TDBEdit;
    wwDBGrid2: TwwDBGrid;
    cdsAux: TClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure CmeDetalheDelete(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure btnAddPrazoEntClick(Sender: TObject);
    procedure BtnDelPrazoEntClick(Sender: TObject);
    procedure BtnLimpaEntClick(Sender: TObject);
    procedure BtnAddPagClick(Sender: TObject);
    procedure btnDelPagClick(Sender: TObject);
    procedure BtnLimpaPagClick(Sender: TObject);
    procedure edPrazoEntExit(Sender: TObject);
    procedure edPrazoPagExit(Sender: TObject);
    procedure dblcItemCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcDescCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure btnAddAgregClick(Sender: TObject);
    procedure btnDelAgregClick(Sender: TObject);
    procedure btnLimpaAgregClick(Sender: TObject);
    procedure dblcAgregCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure edAliquotaExit(Sender: TObject);
    procedure cmpFornExit(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure dsDetDataChange(Sender: TObject; Field: TField);
    procedure btnCopiaPrazoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnOkDetClick(Sender: TObject);
  private
    { Private declarations }

    aGrupos : array of TGrupos;

    rQtdeAtend    : Double;
    rPercPag      : Double;
    //
    UnMedida      : TCtrlUnMedida;
    OrdemCompra   : TCtrlOrdemCompra;
    TipoAgregado  : TCtrlTipoAgregado;
    Comprador     : TCtrlComprador;
    //
    Procedure Sel( NumOC : LongInt );
    Procedure SelFilhos( IdItemOC : Double );
    Procedure CalcQtdeAtend;
    Procedure CalcPercPag;
    Function  VerifItens : Boolean;
    Procedure CopiaPrazos;
    Function  VerificaPrazos(Var s : String) : Boolean;
  public
    { Public declarations }
  end;




var
  FrmMTCadOCSemCot: TFrmMTCadOCSemCot;

implementation

{$R *.DFM}

Uses uMensErro, uSistema, DBaseDados, fAguarde;

var Modulo : TModulo;

procedure TFrmMTCadOCSemCot.FormCreate(Sender: TObject);
begin
  inherited;
  OrdemCompra := TCtrlOrdemCompra.Create;
  OrdemCompra.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer);
  OrdemCompra.cdsOC             := cds;
  OrdemCompra.cdsItemOC         := cdsItemOC;
  OrdemCompra.cdsPrazoEntregaOC := cdsPrazoEntOC;
  OrdemCompra.cdsPrazoPgtoOC    := cdsPrazoPagOC;
  OrdemCompra.cdsAgregItemOC    := cdsAgregItemOC;
  OrdemCompra.cdsSCItemOC       := cdsSCItemOC;
  //
  Comprador := TCtrlComprador.Create;
  Comprador.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
  //
  TipoAgregado := TCtrlTipoAgregado.Create;
  TipoAgregado.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer);
  //
  unMedida := TCtrlUnMedida.Create;
  unMedida.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer);
  //
  cdsArtigo.Data := Comprador.ListaArtigosOCSemCotacao(Sistema.IdUsuario,Sistema.IdEmpresa);
  //
  cdsAgreg.Data  := TipoAgregado.ListAgregados;
  //
  MontaSelect.Filtro.Add('OC.IDPESSOA = '+IntToStr(Sistema.IdEmpresa) );

  Sel(-1);
  SelFilhos(-1);
end;




procedure TFrmMTCadOCSemCot.Sel( NumOC: LongInt );
begin
  cds.Data            := OrdemCompra.ListOC( NumOC );
  cdsItemOC.Data      := OrdemCompra.GetItemOC( Sistema.IdEmpresa,NumOC );
  cdsPrazoEntOC.Data  := OrdemCompra.GetPrazoEntregaOC( NumOC );
  cdsPrazoPagOC.Data  := OrdemCompra.GetPrazoPgtoOC( NumOC );
  cdsAgregItemOC.Data := OrdemCompra.GetAgregItemOC( NumOC );
  cdsSCItemOC.Data    := OrdemCompra.GetSCItemOC( NumOC );
end;




procedure TFrmMTCadOCSemCot.SelFilhos( IdItemOC : Double );
begin
   rQtdeAtend := 0;
   rPercPag   := 0;
   If IdItemOC >= 1 Then
      Begin
          cdsPrazoEntOC.Filtered  := False;
          cdsPrazoEntOC.Filter    := 'IDITEMOC = '+ FloatToStr(IdItemOC);
          cdsPrazoEntOC.Filtered  := True;
          //
          cdsPrazoPagOC.Filtered  := False;
          cdsPrazoPagOC.Filter    := 'IDITEMOC = '+ FloatToStr(IdItemOC);
          cdsPrazoPagOC.Filtered  := True;
          //
          cdsAgregItemOC.Filtered := False;
          cdsAgregItemOC.Filter   := 'IDITEMOC = '+ FloatToStr(IdItemOC);
          cdsAgregItemOC.Filtered := True;
          //
          cdsSCItemOC.Filtered    := False;
          cdsSCItemOC.Filter      := 'IDITEMOC = '+ FloatToStr(IdItemOC);
          cdsSCItemOC.Filtered    := True;
          //
      End
   Else
      Begin
          cdsPrazoEntOC.Filtered  := False;
          cdsPrazoEntOC.Filter    := '';
          //
          cdsPrazoPagOC.Filtered  := False;
          cdsPrazoPagOC.Filter    := '';
          //
          cdsAgregItemOC.Filtered := False;
          cdsAgregItemOC.Filter   := '';
          //
          cdsSCItemOC.Filtered    := False;
          cdsSCItemOC.Filter      := '';
      End;
   If Not cdsItemOC.IsEmpty Then
      LbArt.Caption := cdsItemOC.fieldByName('DESCRICAO').AsString
   Else
      LbArt.Caption := '';
end;




procedure TFrmMTCadOCSemCot.CmeCadastroInsert(Sender: TObject);
begin
   Sel(-1);
   CmeCadastro.RepetirInsert := False;
   inherited;
   cmpForn.SetFocus;
   cds.FieldByName('DATAOC').AsDateTime      := Date;
   cds.FieldByName('FLGTIPOFRETE').AsInteger := 0;
//   cds.FieldByName('NUMOC').AsInteger        := OrdemCompra.GetNextID;
   cds.FieldByName('IDPESSOA').AsInteger     := Sistema.IdEmpresa;   
   cds.FieldByName('OCATENDIDA').AsString    := 'F';
   cds.FieldByName('FLGIMPRESSA').AsString   := 'F';
   cds.FieldByName('FLGCOMSEMOC').AsString   := 'C';
   cds.FieldByName('FLGCOMSEMCOT').AsString  := 'S';
end;




procedure TFrmMTCadOCSemCot.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  cmpForn.SetFocus;
end;




procedure TFrmMTCadOCSemCot.CmeCadastroFind(Sender: TObject);
begin
  inherited;
   if MontaSelect.RetornouValor Then
      Sel(StrToIntDef(MontaSelect.ValoresChave[0],0));
end;




procedure TFrmMTCadOCSemCot.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
Var
   sArt : String;
Begin

  Accept := True;

  { Não permitir confirmar OC sem itens.                                       }
  If ( cdsItemOC.IsEmpty = True  ) Then Begin

    MsgDlg( 'Não é permitido gravar uma O.C. sem itens.', 'Erro', mtError, [mbOk], 0);

    Accept := False;
    Exit;

  End;

   If cmpForn.Valida <> vcOK Then
     Begin
         cmpForn.SetFocus;
         Accept := False;
     End

   Else

   If Trim(edDataOC.Text) = '' Then
     Begin
         MsgDlg('Data da O.C.','Erro',mtError,[mbOk],0);
         edDataOC.SetFocus;
         Accept := False;
     End
   Else

   If Not VerifItens Then
      Begin
          Accept := False;
      End;

   If Not VerificaPrazos(sArt) Then
      Begin
          MsgDlg('O item '+sArt+' não possui os prazos preenchidos .','Erro',mtError,[mbOk],0);
          Accept := False;
      End;
end;




procedure TFrmMTCadOCSemCot.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
   cdsAux.Data := OrdemCompra.GetDataPacket('SELECT SEQITEMOC.NEXTVAL FROM DUAL');

   dblcItem.Enabled := True;
   dblcDesc.Enabled := True;
   dblcItem.SetFocus;
   cdsItemOC.FieldByName('NUMOC').AsFloat            := cds.FieldByName('NUMOC').AsFloat;
   cdsItemOC.FieldByName('IDITEMOC').AsFloat         := cdsAux.Fields[0].AsFloat;
   cdsItemOC.FieldByName('FLGITEMATENDIDO').AsString := 'F';
end;




procedure TFrmMTCadOCSemCot.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  dblcItem.Text    := cdsItemOC.FieldByName('CODARTIGO').AsString;
  dblcDesc.Text    := cdsItemOC.FieldByName('DESCRICAO').AsString;
  dblcItem.Enabled := False;
  dblcDesc.Enabled := False;
  //
  edQtdePed.SetFocus;
end;




procedure TFrmMTCadOCSemCot.CmeDetalheDelete(Sender: TObject);
begin
 If MsgDlg('Confirma a exclusão do Item da O.C.','Exclusão',mtConfirmation,[mbOk,mbcancel],0) = mrOk Then
     Begin
        cdsPrazoEntOC.First;
        While Not cdsPrazoEntOC.EOF  Do cdsPrazoEntOC.Delete;
        cdsPrazoPagOC.First;
        While Not cdsPrazoPagOC.EOF  Do cdsPrazoPagOC.Delete;
        cdsPrazoEntOC.First;
        While Not cdsAgregItemOC.EOF Do cdsAgregItemOC.Delete;
        cdsSCItemOC.First;
        While Not cdsSCItemOC.EOF Do cdsSCItemOC.Delete;
        inherited;
     End;
end;




procedure TFrmMTCadOCSemCot.CmeDetalheConfirma(Sender: TObject);
begin
   If cdsItemOC.State in DsEditModes Then
      Begin
         cdsItemOC.FieldByName('DESCRICAO').AsString    := dblcDesc.Text;
         cdsItemOC.FieldByName('CODGRUPOPROD').AsString := cdsArtigo.FieldByName('CODGRUPOPROD').AsString;

         cdsItemOC.FieldByName('TOTAL').AsFloat := cdsItemOC.FieldByName('QTDEPEDIDA').AsFloat * cdsItemOC.FieldByName('VALORUN').AsFloat;

         dblcDesc.Clear;
         dblcItem.Clear;
         //
         If cdsItemOC.State = dsInsert Then
            Begin
               cdsItemOC.FieldByName('FLGITEMATENDIDO').AsString := 'F';
               //
               cdsSCItemOC.Append;
               cdsSCItemOC.FieldByName('IDITEMOC').AsFloat     := cdsItemOC.FieldByName('IDITEMOC').AsFloat;
               cdsSCItemOC.FieldByName('NUMSOLCOMPRA').AsFloat := cdsArtigo.FieldByName('NUMSOLCOMPRA').AsFloat;
               cdsSCItemOC.FieldByName('IDITEMSOLI').AsFloat   := cdsArtigo.FieldByName('IDITEMSOLI').AsFloat;
               cdsSCItemOC.Post;
            End;
         Inherited;
      End
   Else
      Inherited;

end;




procedure TFrmMTCadOCSemCot.btnAddPrazoEntClick(Sender: TObject);
begin
  inherited;
  CalcQtdeAtend;
  If dsDet.DataSet.IsEmpty Then
     Begin
        MsgDlg('Não existe item cadastrado.','Erro',mtError,[mbOk],0);
     End
  Else
  If edPrazoEnt.Value < 0 Then
     Begin
        MsgDlg('Prazo de Entrega inválido.','Erro',mtError,[mbOk],0);
        edPrazoEnt.SetFocus;
     End
  Else
  If Trim(edDataEnt.Text) = '' then
     Begin
        MsgDlg('Data de Entrega inválida.','Erro',mtError,[mbOk],0);
        edPrazoEnt.SetFocus;
     End
  Else
  If Format('%12.2f',[cdsItemOC.FieldByName('QTDEPEDIDA').AsFloat]) > Format('%12.2f',[rQtdeAtend]) Then
     Begin
        cdsPrazoEntOC.Append;
        cdsPrazoEntOC.FieldByName('IDITEMOC').AsFloat       := cdsItemOC.FieldByName('IDITEMOC').AsFloat;
        cdsPrazoEntOC.FieldByName('PRAZOENTREGA').AsFloat   := edPrazoEnt.Value;
        cdsPrazoEntOC.FieldByName('QTDEENTREGA').AsFloat    := edQtdeEnt.Value;
        cdsPrazoEntOC.FieldByName('PERIODOPRAZO').AsString  := 'D';
        cdsPrazoEntOC.FieldByName('DATAENTREGA').AsDateTime := edDataEnt.Date;
        cdsPrazoEntOC.Post;
        BtnLimpaEnt.Click;
     End
   Else
     Begin
        MsgDlg('Quantidade fornecida já está completa','Informação',mtInformation,[mbOk],0);
        BtnLimpaEnt.Click;
     End;
end;




procedure TFrmMTCadOCSemCot.BtnDelPrazoEntClick(Sender: TObject);
begin
  inherited;
  If Not cdsPrazoEntOC.IsEmpty Then
     Begin
        edPrazoEnt.Value := cdsPrazoEntOC.FieldByName('PRAZOENTREGA').AsFloat;
        edQtdeEnt.Value  := cdsPrazoEntOC.FieldByName('QTDEENTREGA').AsFloat;
        edDataEnt.Date   := cdsPrazoEntOC.FieldByName('DATAENTREGA').AsDateTime;
        cdsPrazoEntOC.Delete;
     End;

end;




procedure TFrmMTCadOCSemCot.BtnLimpaEntClick(Sender: TObject);
begin
  inherited;
  CalcQtdeAtend;
  edQtdeEnt.Clear;
  edPrazoEnt.Value := 0;;
  edDataEnt.Clear;
  edQtdeEnt.Value := cdsItemOC.FieldByName('QTDEPEDIDA').AsFloat - rQtdeAtend;
  edQtdeEnt.SetFocus;
end;




procedure TFrmMTCadOCSemCot.BtnAddPagClick(Sender: TObject);
Var
  rCem : Double;
begin
  inherited;
  rCem := 100;
  CalcPercPag;
  If dsDet.DataSet.IsEmpty Then
     Begin
        MsgDlg('Não existe item cadastrado.','Erro',mtError,[mbOk],0);
     End
  Else  
  If edPrazoPag.Value < 0 Then
     Begin
        MsgDlg('Prazo de Entrega inválida.','Erro',mtError,[mbOk],0);
        edPrazoPag.SetFocus;
     End
  Else
  If Trim(edDataPag.Text) = '' then
     Begin
        MsgDlg('Data de Pagamento inválida.','Erro',mtError,[mbOk],0);
        edPrazoPag.SetFocus;
     End
  Else
  If Format('%12.2f',[rCem]) > Format('%12.2f',[rPercPag]) Then
     Begin
        cdsPrazoPagOC.Append;
        cdsPrazoPagOC.FieldByName('IDITEMOC').AsFloat      := cdsItemOC.FieldByName('IDITEMOC').AsFloat;
        cdsPrazoPagOC.FieldByName('PRAZOPGTO').AsFloat     := edPrazoPag.Value;
        cdsPrazoPagOC.FieldByName('PERIODOPRAZO').AsString := 'D';
        cdsPrazoPagOC.FieldByName('PERCPAGTO').AsFloat     := edPercPag.Value;
        cdsPrazoPagOC.FieldByName('DATAPAGTO').AsDateTime  := edDataPag.Date;
        cdsPrazoPagOC.Post;
        BtnLimpaPag.Click;
     End
   Else
     Begin
        MsgDlg('Percentual igual a 100%','Informação',mtInformation,[mbOk],0);
        BtnLimpaPag.Click;
     End;
end;




procedure TFrmMTCadOCSemCot.btnDelPagClick(Sender: TObject);
begin
  inherited;
  If Not cdsPrazoPagOC.IsEmpty Then
     Begin
        edPercPag.Value  := cdsPrazoPagOC.FieldByName('PERCPAGTO').AsFloat;
        edPrazoPag.Value := cdsPrazoPagOC.FieldByName('PRAZOPGTO').AsFloat;
        edDataPag.Date   := cdsPrazoPagOC.FieldByName('DATAPAGTO').AsDateTime;
        cdsPrazoPagOC.Delete;
     End;
end;




procedure TFrmMTCadOCSemCot.BtnLimpaPagClick(Sender: TObject);
begin
  inherited;
  CalcPercPag;
  edPercPag.Clear;
  edPrazoPag.Value := 0;
  edDataPag.Clear;
  edPercPag.Value := 100 - rPercPag;
  edPercPag.SetFocus;
end;




procedure TFrmMTCadOCSemCot.edPrazoEntExit(Sender: TObject);
begin
  inherited;
  edDataEnt.Date := edPrazoEnt.Value + Date;
end;




procedure TFrmMTCadOCSemCot.edPrazoPagExit(Sender: TObject);
begin
  inherited;
  edDataPag.Date := edPrazoPag.Value + Date;
end;




procedure TFrmMTCadOCSemCot.dblcItemCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
 If (modified) And (Trim(dblcItem.Text) <> '') Then
     Begin
         dblcDesc.LookupValue := dblcItem.LookupValue;
         edQtdePed.Value      := cdsArtigo.FieldByName('QTDEPEDIDA').AsFloat;
         cdsItemOC.FieldByName('CODARTIGO').AsString := cdsArtigo.FieldByName('CODARTIGO').AsString;
         cdsItemOC.FieldByName('QTDEPEDIDA').AsFloat := cdsArtigo.FieldByName('QTDEPEDIDA').AsFloat;
         cdsItemOC.FieldByName('CODMEDIDA').AsString := cdsArtigo.FieldByName('CODMEDIDA').AsString;
         cdsItemOC.FieldByName('OBSITEMOC').AsString := cdsArtigo.FieldByName('OBSITEMSOLIC').AsString;
         If (cdsArtigo.FieldByName('IDPRODVARI').IsNull) Or (cdsArtigo.FieldByName('IDPRODVARI').AsInteger <= 0) Then
             cdsItemOC.FieldByName('IDPRODVARI').Clear
         Else
             cdsItemOC.FieldByName('IDPRODVARI').AsInteger := cdsArtigo.FieldByName('IDPRODVARI').AsInteger;

         cdsItemOC.FieldByName('IDITEMSOLI').AsInteger     := cdsArtigo.FieldByName('IDITEMSOLI').AsInteger;

         cdsUnidMed.Data := UnMedida.ListUnMedida(cdsArtigo.FieldByName('CODPRODUTO').AsString);
     End;
end;




procedure TFrmMTCadOCSemCot.dblcDescCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
 If (modified) And (Trim(dblcDesc.Text) <> '') Then
     Begin
         dblcItem.LookupValue := dblcDesc.LookupValue;
         edQtdePed.Value      := cdsArtigo.FieldByName('QTDEPEDIDA').AsFloat;
         cdsItemOC.FieldByName('CODARTIGO').AsString := cdsArtigo.FieldByName('CODARTIGO').AsString;
         cdsItemOC.FieldByName('QTDEPEDIDA').AsFloat := cdsArtigo.FieldByName('QTDEPEDIDA').AsFloat;
         cdsItemOC.FieldByName('CODMEDIDA').AsString := cdsArtigo.FieldByName('CODMEDIDA').AsString;
         cdsItemOC.FieldByName('OBSITEMOC').AsString := cdsArtigo.FieldByName('OBSITEMSOLIC').AsString;
         If (cdsArtigo.FieldByName('IDPRODVARI').IsNull) Or (cdsArtigo.FieldByName('IDPRODVARI').AsInteger <= 0) Then
             cdsItemOC.FieldByName('IDPRODVARI').Clear
         Else
             cdsItemOC.FieldByName('IDPRODVARI').AsInteger := cdsArtigo.FieldByName('IDPRODVARI').AsInteger;

         cdsItemOC.FieldByName('IDITEMSOLI').AsInteger     := cdsArtigo.FieldByName('IDITEMSOLI').AsInteger;

         cdsUnidMed.Data := UnMedida.ListUnMedida(cdsArtigo.FieldByName('CODPRODUTO').AsString);
     End;

end;




Procedure TFrmMTCadOCsemCot.CalcQtdeAtend;
Begin
   rQtdeAtend := 0;
   cdsPrazoEntOC.DisableControls;
   cdsPrazoEntOC.First;
   While Not cdsPrazoEntOC.EOF Do
      Begin
         rQtdeAtend := rQtdeAtend + cdsPrazoEntOC.FieldByName('QTDEENTREGA').AsFloat;
         cdsPrazoEntOC.Next;
      End;
   cdsPrazoEntOC.EnableControls;
End;




Procedure TFrmMTCadOCsemCot.CalcPercPag;
Begin
   rPercPag := 0;
   cdsPrazoPagOC.DisableControls;
   cdsPrazoPagOC.First;
   While Not cdsPrazoPagOC.EOF Do
      Begin
          rPercPag := rPercPag + cdsPrazoPagOC.FieldByName('PERCPAGTO').AsFloat;
          cdsPrazoPagOC.Next;
      End;
   cdsPrazoPagOC.EnableControls;
End;




function TFrmMTCadOCSemCot.VerifItens: Boolean;
Var
   bOk : Boolean;
Begin
   bOk := True;
   cdsItemOC.DisableControls;
   Try
      cdsItemOC.First;
      While (Not cdsItemOC.EOF) and ( bOk ) Do
         Begin
            SelFilhos( cdsItemOC.FieldByName('IDITEMOC').AsFloat );
            If cdsPrazoEntOC.IsEmpty Then
               Begin
                   MsgDlg('O Item '+cdsItemOC.FieldByName('DESCRICAO').AsString +' não possui Prazo de Entrega','Erro',mtError,[mbOk],0);
                   bOk := False;
               End
            Else
            If cdsPrazoPagOC.IsEmpty Then
               Begin
                   MsgDlg('O Item '+cdsItemOC.FieldByName('DESCRICAO').AsString +' não possui Prazo de Pagamento','Erro',mtError,[mbOk],0);
                   bOk := False;
               End;
            cdsItemOC.Next;
         End;
   Finally
       cdsItemOC.EnableControls;
       Result := bOk;
   End;
end;




procedure TFrmMTCadOCSemCot.btnAddAgregClick(Sender: TObject);
begin
  inherited;
  If dsDet.DataSet.IsEmpty Then
     Begin
        MsgDlg('Não existe item cadastrado.','Erro',mtError,[mbOk],0);
     End
  Else
  If Trim(dblcAgreg.Text) = '' Then
     Begin
        MsgDlg('Custo Agregado não prenchido.','Erro',mtError,[mbOk],0);
        dblcAgreg.SetFocus;
     End
  Else   
  If edBase.Value < 0 Then
     Begin
        MsgDlg('Base de Cálculo inválida.','Erro',mtError,[mbOk],0);
        edBase.SetFocus;
     End
  Else
  If edValor.Value < 0 Then
     Begin
        MsgDlg('Valor inválida.','Erro',mtError,[mbOk],0);
        edValor.SetFocus;
     End
  Else
     Begin
        cdsAgregItemOC.Append;
        cdsAgregItemOC.FieldByName('IDITEMOC').AsFloat         := cdsItemOC.FieldByName('IDITEMOC').AsFloat;
        cdsAgregItemOC.FieldByName('CODTIPOCUSTAGREG').AsFloat := cdsAgreg.FieldByName('CODTIPOCUSTAGREG').AsFloat;
        cdsAgregItemOC.FieldByName('DESCCUSTAGREG').AsString   := dblcAgreg.Text;
        If edAliquota.Value > 0 Then
           cdsAgregItemOC.FieldByName('ALIQUOTA').AsFloat      := edAliquota.Value;

        cdsAgregItemOC.FieldByName('BASECALCULO').AsFloat      := edBase.Value;
        cdsAgregItemOC.FieldByName('VLRAGREGITEM').AsFloat     := edValor.Value;
        cdsAgregItemOC.Post;
        btnLimpaAgreg.Click;
     End;
end;




procedure TFrmMTCadOCSemCot.btnDelAgregClick(Sender: TObject);
begin
  inherited;
  If Not cdsAgregItemOC.IsEmpty Then
     Begin
        dblcAgreg.LookupValue := FloatToStr( cdsAgregItemOC.FieldByName('CODTIPOCUSTAGREG').AsFloat );
        edAliquota.Value      := cdsAgregItemOC.FieldByName('ALIQUOTA').AsFloat;
        edBase.Value          := cdsAgregItemOC.FieldByName('BASECALCULO').AsFloat;
        edValor.Value         := cdsAgregItemOC.FieldByName('VLRAGREGITEM').AsFloat;
        cdsAgregItemOC.Delete;
     End;
end;




procedure TFrmMTCadOCSemCot.btnLimpaAgregClick(Sender: TObject);
begin
  inherited;
  dblcAgreg.Clear;
  edAliquota.Value := 0;
  edBase.Value     := cdsItemOC.FieldByName('QTDEPEDIDA').AsFloat * cdsItemOC.FieldByName('VALORUN').AsFloat;
  edValor.Value    := 0;
  dblcAgreg.SetFocus;
end;




procedure TFrmMTCadOCSemCot.dblcAgregCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If (modified) And (Trim(dblcAgreg.Text) <> '') Then
     Begin
         If cdsAgreg.FieldByName('PERCVALOR').AsString = 'V' Then
            edAliquota.Enabled := False
         Else
            edAliquota.Enabled := True;
         edBase.Enabled  := edAliquota.Enabled;
     End;

end;




procedure TFrmMTCadOCSemCot.edAliquotaExit(Sender: TObject);
begin
  inherited;
  edValor.Value := (edAliquota.Value * edBase.Value) /100;
end;




procedure TFrmMTCadOCSemCot.cmpFornExit(Sender: TObject);
begin
  inherited;
  If cds.FieldByName('CONTATO').IsNull Then
     cds.FieldByName('CONTATO').asString :=  OrdemCompra.GetUltContato(Sistema.IdEmpresa,cmpForn.ForCliReg.Id);
end;




function TFrmMTCadOCSemCot.VerificaPrazos(var s: String): Boolean;
begin
   Result := True;
   Try
     cdsItemOC.DisableControls;
     cdsItemOC.First;
     While (Not cdsItemOC.Eof) And (Not Result) Do
        Begin
           SelFilhos( cdsItemOC.FieldByName('IDITEMOC').AsFloat );
           If (cdsPrazoEntOC.IsEmpty) Or (cdsPrazoPagOC.IsEmpty) Then
              Begin
                 Result := False;
                 s      := cdsItemOC.FieldByName('DESCRICAO').AsString;
              End;
           cdsItemOC.Next;
        End;
   Finally
      cdsItemOC.EnableControls;
      cdsItemOC.First;
   End;
end;




procedure TFrmMTCadOCSemCot.CopiaPrazos;
Var
   PrazoEnt : TList;
   PrazoPag : TList;
   objEnt   : TPrazoEnt;
   objPag   : TPrazoPag;
   x        : Integer;
begin
  //---------------------------------------------------------------------------------------------
  // Incializa os vetores dinamicos para a quantidade de registos
  // existente no prazos do preimeiro artigo
  //---------------------------------------------------------------------------------------------
  PrazoEnt := TList.Create;
  PrazoPag := TList.Create;
  cdsItemOC.First;
  // Prazo de Entrega
   cdsPrazoEntOC.First;
   While Not cdsPrazoEntOC.Eof Do
       Begin
          ObjEnt := TPrazoEnt.Create;
          ObjEnt.PRAZOENTREGA := cdsPrazoEntOC.FieldByName('PRAZOENTREGA').AsFloat;
          ObjEnt.QTDEENTREGA  := cdsPrazoEntOC.FieldByName('QTDEENTREGA').AsFloat/cdsItemOC.FieldByName('QTDEPEDIDA').AsFloat;
          ObjEnt.DATAENTREGA  := cdsPrazoEntOC.FieldByName('DATAENTREGA').AsDateTime;
          cdsPrazoEntOC.Next;
          PrazoEnt.Add(ObjEnt);
       End;
  // Prazo de Pagamento
   cdsPrazoPagOC.First;
   While Not cdsPrazoPagOC.Eof Do
       Begin
          ObjPag := TPrazoPag.Create;
          ObjPag.PRAZOPGTO := cdsPrazoPagOC.FieldByName('PRAZOPGTO').AsFloat;
          ObjPag.PERCPAGTO := cdsPrazoPagOC.FieldByName('PERCPAGTO').AsFloat;
          ObjPag.DATAPAGTO := cdsPrazoPagOC.FieldByName('DATAPAGTO').AsDateTime;
          cdsPrazoPagOC.Next;
          PrazoPag.Add(ObjPag);
       End;
   Try
     cdsItemOC.DisableControls;
     //
     FrmAguarde.Min := 0;
     FrmAguarde.Max := cdsItemOC.RecordCount;
     FrmAguarde.Pos := 0;
     //
     cdsItemOC.Next;
     FrmAguarde.Mostra('Copiando Prazos Aguarde...');
     While Not cdsItemOC.Eof Do
        Begin
           SelFilhos( cdsItemOC.FieldByName('IDITEMOC').AsFloat );
           If cdsPrazoEntOC.IsEmpty Then
           For x := 0 To Pred(PrazoEnt.Count) Do
               Begin
                  ObjEnt := TPrazoEnt(PrazoEnt.Items[x]);
                  cdsPrazoEntOC.Append;
                  cdsPrazoEntOC.FieldByName('IDITEMOC').AsFloat       := cdsItemOC.FieldByName('IDITEMOC').AsFloat;
                  cdsPrazoEntOC.FieldByName('PARCELAENTREGA').AsFloat := x + 1;
                  cdsPrazoEntOC.FieldByName('PRAZOENTREGA').AsFloat   := ObjEnt.PRAZOENTREGA;
                  cdsPrazoEntOC.FieldByName('QTDEENTREGA').AsFloat    := cdsItemOC.FieldByName('QTDEPEDIDA').AsFloat * ObjEnt.QTDEENTREGA;
                  cdsPrazoEntOC.FieldByName('PERIODOPRAZO').AsString  := 'D';
                  cdsPrazoEntOC.FieldByName('DATAENTREGA').AsDateTime := ObjEnt.DATAENTREGA;
                  cdsPrazoEntOC.Post;
               End;
           If cdsPrazoPagOC.IsEmpty Then
           For x := 0 To Pred(PrazoPag.Count) Do
               Begin
                  ObjPag := TPrazoPag(PrazoPag.Items[x]);
                  cdsPrazoPagOC.Append;
                  cdsPrazoPagOC.FieldByName('IDITEMOC').AsFloat      := cdsItemOC.FieldByName('IDITEMOC').AsFloat;
                  cdsPrazoPagOC.FieldByName('PARCELAPGTO').AsFloat   := x + 1;
                  cdsPrazoPagOC.FieldByName('PRAZOPGTO').AsFloat     := ObjPag.PRAZOPGTO;
                  cdsPrazoPagOC.FieldByName('PERIODOPRAZO').AsString := 'D';
                  cdsPrazoPagOC.FieldByName('PERCPAGTO').AsFloat     := ObjPag.PERCPAGTO;
                  cdsPrazoPagOC.FieldByName('DATAPAGTO').AsDateTime  := ObjPag.DATAPAGTO;
                  cdsPrazoPagOC.Post;
               End;
            cdsItemOC.Next;
            FrmAguarde.Pos := FrmAguarde.Pos + 1;
            Application.ProcessMessages;
        End;
   Finally
      // Libera os objetos da memoria
      While PrazoEnt.Count > 0 Do
         Begin
            TPrazoEnt(PrazoEnt.Items[0]).Free;
            PrazoEnt.Delete(0);
         End;
       While PrazoPag.Count > 0 Do
         Begin
            TPrazoPag(PrazoPag.Items[0]).Free;
            PrazoPag.Delete(0);
         End;
      PrazoEnt.Free;
      PrazoPag.Free;
      cdsItemOC.EnableControls;
      FrmAguarde.Apaga;
      cdsItemOC.First;
   End;
end;




procedure TFrmMTCadOCSemCot.CmeCadastroConfirma(Sender: TObject);
Var
   x : Byte;

   i : integer;
   fValorOC, fMaior : extended;
   sGrupo, sAux : string;
   bEnc : boolean;
begin

  cdsItemOC.DisableControls;

  Try
     cdsItemOC.First;
     While Not cdsItemOC.EOF Do
        Begin
           SelFilhos( cdsItemOC.FieldByName('IDITEMOC').AsInteger );
           x := 0;
           cdsPrazoEntOC.First;
           While Not cdsPrazoEntOC.EOF Do
              Begin
                 Inc( x );
                 cdsPrazoEntOC.Edit;
                 cdsPrazoEntOC.FieldByName('PARCELAENTREGA').AsInteger := x;
                 cdsPrazoEntOC.Post;
                 cdsPrazoEntOC.Next;
              End;
           x := 0;
           cdsPrazoPagOC.First;
           While Not cdsPrazoPagOC.EOF Do
              Begin
                 Inc( x );
                 cdsPrazoPagOC.Edit;
                 cdsPrazoPagOC.FieldByName('PARCELAPGTO').AsInteger  := x;
                 cdsPrazoPagOC.Post;
                 cdsPrazoPagOC.Next;
              End;
           cdsItemOC.Next;
        End;

     SetLength( aGrupos, 0 );
     fValorOC := 0;
     cdsItemOC.First;

     while not cdsItemOC.Eof do
     begin

      fValorOC := fValorOC + ( cdsItemOC.FieldByName('VALORUN').AsFloat * cdsItemOC.FieldByName('QTDEPEDIDA').AsFloat );
      sAux := Modulo.LeGrupoProd( cdsItemOC.FieldByName('CODARTIGO').AsString );
      bEnc := False;

      for i := 0 to High( aGrupos ) do
      begin

        if aGrupos[i].sGrupo = sAux then
        begin
          aGrupos[i].fValor := aGrupos[i].fValor + cdsItemOC.FieldByName('TOTAL').AsFloat;
          bEnc := True;
          break;
        end;

      end;

      if not bEnc then
      begin

        SetLength( aGrupos, length( aGrupos ) + 1 );
        aGrupos[High(aGrupos)].sGrupo := sAux;
        aGrupos[High(aGrupos)].fValor := cdsItemOC.FieldByName('TOTAL').AsFloat;

      end;

      cdsItemOC.Next;

     end; { While }


     fMaior := aGrupos[0].fValor;
     sGrupo := aGrupos[0].sGrupo;

     for i := 0 to High( aGrupos ) do
     begin

      if aGrupos[i].fValor > fMaior then
      begin
        fMaior := aGrupos[i].fValor;
        sGrupo := aGrupos[i].sGrupo;
      end;

     end;

     if not ( cds.State in [dsInsert, dsEdit ] ) then cds.Edit;

     cds.FieldByName('GRUPOPROD').AsString := sGrupo;
     cds.FieldByName('VALOROC').AsFloat    := fValorOC;

     cds.Post;

  Finally
     cdsItemOC.EnableControls;
  End;

  // Remove o Filter das query's do item para gravar tudo
  SelFilhos( -1 );

  If Not OrdemCompra.Gravar( Sistema.IdUsuario, True ) Then

     MsgDlg(OrdemCompra.MessageInfo,'Erro',mtError,[mbOk],0)
  Else
     MsgDlg(OrdemCompra.MessageInfo,'Informação',mtInformation,[mbOk],0);

  cdsArtigo.Data := Comprador.ListaArtigosOCSemCotacao(Sistema.IdUsuario,Sistema.IdEmpresa);

  inherited;

end;




procedure TFrmMTCadOCSemCot.dsDetDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  If dsDet.DataSet.State = dsBrowse Then
     Begin
        SelFilhos( cdsItemOC.FieldByName('IDITEMOC').AsFloat );
     End;

end;




procedure TFrmMTCadOCSemCot.btnCopiaPrazoClick(Sender: TObject);
begin
  inherited;
 If Not cdsItemOC.IsEmpty Then
     CopiaPrazos;
  btnCopiaPrazo.Down := False;
end;




procedure TFrmMTCadOCSemCot.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  UnMedida.Free;
  OrdemCompra.Free;
  TipoAgregado.Free;
  Comprador.Free;
end;




procedure TFrmMTCadOCSemCot.bbtnOkDetClick(Sender: TObject);
begin
   If Trim(dblcItem.text) = '' Then
        Begin
           MsgDlg('Item não foi preenchido','Erro',mtError,[mbOK],0);
           dblcItem.SetFocus;
           Exit;
        End;
   If Trim(dblcUN.text) = '' Then
        Begin
           MsgDlg('unidade de medida não foi preenchido','Erro',mtError,[mbOK],0);
           dblcItem.SetFocus;
           Exit;
        End;
    If (edQtdePed.Value <= 0) Then
        Begin
           MsgDlg('Quantidade pedida não foi preenchida','Erro',mtError,[mbOK],0);
           edQtdePed.SetFocus;
           Exit;
        End;
    If edPreco.value <= 0  Then
       Begin
          MsgDlg('Preço não foi preenchido','Erro',mtError,[mbOK],0);
          edPrazoEnt.SetFocus;
          Exit;
       End;

  inherited;

end;




end.




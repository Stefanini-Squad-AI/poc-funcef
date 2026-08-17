unit FAtrComprador;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, Db, DBTables, Wwquery, wwdblook,
  CMDBLookupCombo, Grids, Wwdbigrd, Wwdbgrid, FSairAjuda, Wwdatsrc,
  fcdbtreeview, fcTreeView;

type
  TFrmAtrComprador = class(TfrmSairAjuda)
    qryGrupo: TwwQuery;
    qryGrupoDESCGRUPOPROD: TStringField;
    qryGrupoCODGRUPOPROD: TStringField;
    qryArtigo: TwwQuery;
    qryItem: TwwQuery;
    qryItemNUMSOLCOMPRA: TFloatField;
    qryItemCODARTIGO: TStringField;
    qryItemCODMEDIDA: TStringField;
    qryItemQTDEPEDIDA: TFloatField;
    qryItemDESCRICAO: TStringField;
    qryItemIDITEMSOLI: TFloatField;
    RgEmpresa: TRadioGroup;
    dblcGrupo: TCMDBLookupCombo;
    dblcArt: TwwDBLookupCombo;
    dblcSCI: TCMDBLookupCombo;
    Label1: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    BtnLimpar: TSpeedButton;
    BtnSelecinar: TSpeedButton;
    Bevel1: TBevel;
    qryComp: TwwQuery;
    dsComp: TwwDataSource;
    qryItemAtrib: TwwQuery;
    qryCompIDCOMPRADOR: TFloatField;
    qryCompNOMEUSUARIO: TStringField;
    qrySCICombo: TwwQuery;
    FloatField4: TFloatField;
    qryItemCODGRUPOPROD: TStringField;
    qryVerifComp: TwwQuery;
    qryVerifCompIDCOMPRADOR: TFloatField;
    qryItemAtribNUMSOLCOMPRA: TFloatField;
    qryItemAtribCODARTIGO: TStringField;
    qryItemAtribCODMEDIDA: TStringField;
    qryItemAtribQTDEPEDIDA: TFloatField;
    qryItemAtribDESCRICAO: TStringField;
    qryItemAtribIDITEMSOLI: TFloatField;
    plnBar: TPanel;
    dsItem: TwwDataSource;
    btnAdiciona: TSpeedButton;
    BtnRemove: TSpeedButton;
    updItem: TUpdateSQL;
    plnComp: TPanel;
    Splitter1: TSplitter;
    Panel2: TPanel;
    grdItemAtrib: TwwDBGrid;
    plnItem: TPanel;
    dsItemAtrib: TwwDataSource;
    updItemAtrib: TUpdateSQL;
    GrdItem: TwwDBGrid;
    Panel3: TPanel;
    GrdComp: TwwDBGrid;
    Panel1: TPanel;
    qryItemAtribNECESSIDADE: TDateTimeField;
    qryItemNECESSIDADE: TDateTimeField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnLimparClick(Sender: TObject);
    procedure BtnSelecinarClick(Sender: TObject);
    procedure btnAdicionaClick(Sender: TObject);
    procedure BtnRemoveClick(Sender: TObject);
  private
    { Private declarations }
    Function  VerifComp(sCodArt : String; iIdComprador :LongInt) : Boolean;
    Procedure MontaSel( NumSCI : LongInt; sCodArt,sCodGrupoProd : String );
    Procedure Atribuir( Tipo : Char; IdItemSoli,iIdComprador : LongInt );
  public
    { Public declarations }
  end;

var
  FrmAtrComprador : TFrmAtrComprador;

implementation

{$R *.DFM}
Uses uString, uSistema, uDataBase, DBaseDados, uMensErro;

Procedure TFrmAtrComprador.MontaSel( NumSCI : LongInt; sCodArt,sCodGrupoProd : String );
Begin
    qryItem.Close;
    qryItem.Sql.Clear;
    qryItem.Sql.Add(' SELECT                                                                  ');
    qryItem.Sql.Add('	  IT.NUMSOLCOMPRA,                                                    ');
    qryItem.Sql.Add('	  IT.CODARTIGO,                                                       ');
    qryItem.Sql.Add('	  IT.CODMEDIDA,                                                       ');
    qryItem.Sql.Add('     IT.QTDEPEDIDA,                                                      ');
    qryItem.Sql.Add('	  SUBSTR(DECODE(IT.IDPRODVARI,NULL,P.DESCPROD,PV.DESCPRODVARI),1,60) AS DESCRICAO, ');
    qryItem.Sql.Add('     IT.IDITEMSOLI,                                                      ');
    qryItem.Sql.Add('     P.CODGRUPOPROD,                                                     ');
    qryItem.Sql.Add('     SC.DATAENTREGA AS NECESSIDADE                                       ');
    qryItem.Sql.Add(' FROM                            ');
    qryItem.Sql.Add('       ITEMSOLI IT,              ');
    qryItem.Sql.Add('       SOLICOMP SC,              ');
    qryItem.Sql.Add('       PRODUTO P,                ');
    qryItem.Sql.Add('       ARTIGO A,                 ');
    qryItem.Sql.Add('       PRODVARI PV               ');
    qryItem.Sql.Add(' WHERE                           ');
    qryItem.Sql.Add('       (IT.IDCOMPRADOR IS NULL ) ');
    qryItem.Sql.Add('   AND (IT.QTDEPENDENTE > 0    ) ');
    If NumSCI >= 0 Then
      qryItem.Sql.Add('   AND (IT.NUMSOLCOMPRA = '+IntToStr(NumSCI)+')');
    If Trim(sCodArt) <> '' Then
      qryItem.Sql.Add('   AND (IT.CODARTIGO = '''+Espaco( Trim( sCodArt ),14)+''')')
    Else
    If Trim(sCodGrupoProd) <> '' Then
      qryItem.Sql.Add('   AND (RTRIM(P.CODGRUPOPROD) = '''+TRIM(sCodGrupoProd)+''') ');
    If RgEmpresa.ItemIndex = 0 Then
      qryItem.Sql.Add('   AND (SC.IDPESSOA = '+IntToStr( Sistema.IdEmpresa )+')');

    qryItem.Sql.Add('  AND (IT.NUMSOLCOMPRA = SC.NUMSOLCOMPRA)');
    qryItem.Sql.Add('  AND (IT.CODARTIGO = A.CODARTIGO)                      ');
    qryItem.Sql.Add('  AND (A.CODPRODUTO = P.CODPRODUTO)                     ');
    qryItem.Sql.Add('  AND (IT.IDPRODVARI = PV.IDPRODVARI(+))                ');
    qryItem.Sql.Add('  ORDER BY DECODE(IT.IDPRODVARI,NULL,P.DESCPROD,PV.DESCPRODVARI) ');
    qryItem.Open;
    //
    qryComp.Open;
    qryitemAtrib.Open;
End;

procedure TFrmAtrComprador.FormCreate(Sender: TObject);
begin
  inherited;
  qryItem.Close;
  qryItemAtrib.Close;
  qryVerifComp.Close;
  if Not qryItem.Prepared Then qryItem.Prepare;
  if Not qryItemAtrib.Prepared Then qryItemAtrib.Prepare;
  if Not qryVerifComp.Prepared Then qryVerifComp.Prepare;
  //
  qrySCICombo.Open;
  qryGrupo.Open;
  qryArtigo.Open;
  //
  MontaSel(0,'','');
end;


procedure TFrmAtrComprador.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryItem.Close;
  if qryItem.Prepared Then qryItem.UnPrepare;
  qryItemAtrib.Close;
  if qryItemAtrib.Prepared Then qryItemAtrib.UnPrepare;
  qryVerifComp.Close;
  if qryVerifComp.Prepared Then qryVerifComp.UnPrepare;
end;

procedure TFrmAtrComprador.BtnLimparClick(Sender: TObject);
begin
  inherited;
  dblcSCI.Clear;
  dblcArt.Clear;
  dblcGrupo.Clear;
end;

procedure TFrmAtrComprador.BtnSelecinarClick(Sender: TObject);
begin
  inherited;
  If Trim(dblcSCI.Text) <> '' Then
     MontaSel( StrToInt(dblcSCI.LookupValue),dblcArt.LookupValue,dblcGrupo.LookupValue)
  Else
  If Trim(dblcArt.Text) <> '' Then
     MontaSel( -1,dblcArt.LookupValue,'')
  Else
  If Trim(dblcGrupo.Text) <> '' Then
     MontaSel(-1,'',dblcGrupo.LookupValue)
  Else
     MontaSel(-1,'','');

end;

Procedure TFrmAtrComprador.Atribuir( Tipo : Char; IdItemSoli,iIdComprador : LongInt );
Var
   sSql   : String;
   sValor : String;
Begin
   If Tipo = 'A' Then
     sValor := IntToStr(iIdComprador)
   Else
   If Tipo = 'D' Then
     sValor := 'NULL';
   //
   sSql := ' UPDATE ITEMSOLI SET IDCOMPRADOR = '+sValor+' ';
   If IdItemSoli > 0 Then
     sSql := sSql + ' WHERE ( IDITEMSOLI = '+IntToStr(IdItemSoli)+') ';
   Try
      StartTransacao;
      If Not ExecutarQuery(DtmBaseDados.qry,sSql) Then
        Abort;
      CommitTransacao;
      If Tipo = 'A' Then
        Begin
          qryItemAtrib.Close;
          qryItemAtrib.Open;
        End;
   Except
      RollBackTransacao;
      Raise;
   End;
End;

Function TFrmAtrComprador.VerifComp(sCodArt : String; iIdComprador :LongInt) : Boolean;
Begin
  sCodArt := Espaco(Trim(sCodArt),14);
  qryVerifComp.Close;
  qryVerifComp.ParamByName('pIDCOMPRADOR').asFloat := iIdComprador;
  qryVerifComp.ParamByName('pCODARTIGO').asString  := sCodArt;
  qryVerifComp.Open;
  Result := Not qryVerifComp.isEmpty;
End;

procedure TFrmAtrComprador.btnAdicionaClick(Sender: TObject);
Var
   x : Integer;
begin
  inherited;
  For x := 0 To GrdItem.SelectedList.Count -1 Do
    Begin
       qryItem.GotoBookmark(GrdItem.SelectedList.Items[x]);
       If VerifComp(qryItemCODARTIGO.AsString,qryCompIDCOMPRADOR.AsInteger) Then
          Begin
             Atribuir('A',qryItemIDITEMSOLI.AsInteger,qryCompIDCOMPRADOR.AsInteger);
             qryItem.Delete;
          End
       Else
         MsgDlg('O Artigo '+Trim(qryItemDESCRICAO.AsString)+' não pode ser comprado por '+qryCompNOMEUSUARIO.AsString,'Erro',mtError,[mbOK],0);
    End;
end;

procedure TFrmAtrComprador.BtnRemoveClick(Sender: TObject);
Var
   x : Integer;
begin
  inherited;
  qryItemAtrib.DisableControls;
  For x := 0 To grdItemAtrib.SelectedList.Count -1 Do
    Begin
        qryItemAtrib.GotoBookmark(grdItemAtrib.SelectedList.Items[x]);
        Atribuir('D',qryItemAtribIDITEMSOLI.AsInteger,-1);
        qryItemAtrib.Delete;
    End;
  qryItemAtrib.EnableControls;
  BtnSelecinar.Click;
end;

end.

unit FApagaItemSCI;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, FSairAjuda, MontaSelect, Grids, Wwdbigrd,
  Wwdbgrid, Db, DBTables, Wwquery, Wwdatsrc, wwdblook, CMDBLookupCombo,
  ComCtrls;

type
  TFrmApagaItemSCI = class(TfrmSairAjuda)
    plnTitulo: TPanel;
    qrySCICombo: TwwQuery;
    FloatField4: TFloatField;
    qryArtigo: TwwQuery;
    qryGrupo: TwwQuery;
    qryGrupoDESCGRUPOPROD: TStringField;
    qryGrupoCODGRUPOPROD: TStringField;
    Panel1: TPanel;
    Label1: TLabel;
    dblcSCI: TCMDBLookupCombo;
    Label3: TLabel;
    Label2: TLabel;
    dblcGrupo: TCMDBLookupCombo;
    dblcArt: TwwDBLookupCombo;
    BtnSelecinar: TSpeedButton;
    BtnLimpar: TSpeedButton;
    RgEmpresa: TRadioGroup;
    Bevel1: TBevel;
    qryItem: TwwQuery;
    qryItemCODARTIGO: TStringField;
    qryItemDESCRICAO: TStringField;
    qryItemNUMSOLCOMPRA: TFloatField;
    qryItemQTDEPEDIDA: TFloatField;
    qryItemCODMEDIDA: TStringField;
    qryItemIDITEMSOLI: TFloatField;
    qryItemCODGRUPOPROD: TStringField;
    qryItemNECESSIDADE: TDateTimeField;
    dsItem: TwwDataSource;
    GrdItem: TwwDBGrid;
    btnExcluir: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    qryItemFLAG: TFloatField;
    updItem: TUpdateSQL;
    pgBar: TProgressBar;
    lbBar: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BtnLimparClick(Sender: TObject);
    procedure BtnSelecinarClick(Sender: TObject);
    procedure GrdItemDblClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
    Procedure MontaSel( NumSCI : LongInt; sCodArt,sCodGrupoProd : String );
    Procedure ExcluirItem;
  public
    { Public declarations }
  end;

var
  FrmApagaItemSCI: TFrmApagaItemSCI;

implementation

{$R *.DFM}

Uses uString,uSistema, uDataBase, DBaseDados, uMensErro;

procedure TFrmApagaItemSCI.FormCreate(Sender: TObject);
begin
  inherited;
  qrySCICombo.Open;
  qryGrupo.Open;
  qryArtigo.Open;
  //
  MontaSel(0,'','');  
end;

Procedure TFrmApagaItemSCI.MontaSel( NumSCI : LongInt; sCodArt,sCodGrupoProd : String );
Begin
    qryItem.Close;
    qryItem.Sql.Clear;
    qryItem.Sql.Add(' SELECT                ');
    qryItem.Sql.Add('	  (0) AS FLAG,      ');
    qryItem.Sql.Add('	  IT.NUMSOLCOMPRA,  ');
    qryItem.Sql.Add('	  IT.CODARTIGO,     ');
    qryItem.Sql.Add('	  IT.CODMEDIDA,     ');
    qryItem.Sql.Add('     IT.QTDEPEDIDA,    ');
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
End;


procedure TFrmApagaItemSCI.BtnLimparClick(Sender: TObject);
begin
  inherited;
  dblcSCI.Clear;
  dblcArt.Clear;
  dblcGrupo.Clear;
end;

procedure TFrmApagaItemSCI.BtnSelecinarClick(Sender: TObject);
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

procedure TFrmApagaItemSCI.GrdItemDblClick(Sender: TObject);
begin
  inherited;
  qryItem.Edit;
  qryItemFLAG.AsInteger := qryItemFLAG.AsInteger xor 1;
  qryItem.Post;
end;

procedure TFrmApagaItemSCI.ExcluirItem;
Var
   SQL  : String;
   Cont : Integer;
begin
   Try
      Cont := 0;
      qryItem.DisableControls;
      If qryItem.RecordCount > 0 then
         pgBar.Max := qryItem.RecordCount
      Else
         Begin
            MsgDlg('Não há itens selecionados para exclusão','Erro',mtError,[mbOK],0);
            Exit;
         End;
      pgBar.Min      := 0;
      pgBar.Position := 0;
      lbBar.Visible  := True;
      pgBar.Visible  := True;
      Try
         StartTransacao;
         qryItem.First;
         While Not qryItem.Eof Do
            Begin
               // Verifica o item que esta selecionado
               If qryItemFLAG.AsInteger = 1 Then
                  Begin
                     Inc(Cont);
                     SQL := 'DELETE FROM ITEMSOLI WHERE (IDITEMSOLI = '+qryItemIDITEMSOLI.AsString+')';
                     If Not ExecutarQuery(DtmBaseDados.qry,SQL) Then
                        Raise Exception.Create('Erro ao tentar excluir. Verificar com SQL Monitor.');
                  End;
               qryItem.Next;
               pgBar.Position := pgBar.Position + 1;
               Application.ProcessMessages;
            End;
         CommitTransacao;
         MsgDlg('Exclusão de '+IntToStr(Cont) +' Item(s) realizada com sucesso','Informação',mtInformation,[mbOK],0);
      Except
         On E : Exception Do
            Begin
            RollBackTransacao;
            MsgDlg(E.Message,'Erro',mtError,[mbOK],0);
         End;
      End;
   Finally
      lbBar.Visible := False;
      pgBar.Visible := False;
      BtnSelecinar.Click;
      qryItem.EnableControls;
   End;
end;

procedure TFrmApagaItemSCI.btnExcluirClick(Sender: TObject);
begin
  inherited;
  ExcluirItem;
end;

end.

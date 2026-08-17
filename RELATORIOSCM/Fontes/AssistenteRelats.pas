unit AssistenteRelats;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, TreeWzd, StdCtrls, Buttons, ComCtrls, wwdblook, CMDBLookupCombo,
  Db, DBTables, Wwquery, MontaSelect, Grids, Wwdbigrd, Wwdbgrid, Wwdatsrc,
  TREdit, uSistema, ColorGrd, FFiltraSql, DBCtrls;

type
  TFrmAssistenteRelats = class(TForm)
    TwCons: TTreeWzd;
    NtbAssist: TNotebook;
    Bevel1: TBevel;
    QryConsultas: TwwQuery;
    GroupBox1: TGroupBox;
    BtnAnterior: TBitBtn;
    BtnProximo: TBitBtn;
    BtnCancela: TBitBtn;
    BtnEncerra: TBitBtn;
    Label4: TLabel;
    CmbCampo: TComboBox;
    Label6: TLabel;
    EdtTipo: TEdit;
    BtnInclui: TBitBtn;
    BtnExclui: TBitBtn;
    BtnPesquisa: TBitBtn;
    Bevel2: TBevel;
    QryAux: TwwQuery;
    MsConsulta: TMontaSelect;
    EdtCons: TEdit;
    SpeedButton1: TSpeedButton;
    wwDBGrid1: TwwDBGrid;
    DsFields: TwwDataSource;
    QryFIelds: TwwQuery;
    UpdFields: TUpdateSQL;
    LstGrupo: TListBox;
    BtnUp: TBitBtn;
    BtnDow: TBitBtn;
    DlgFile: TSaveDialog;
    ColorDlg: TColorDialog;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    RadioGroup1: TRadioGroup;
    GroupBox4: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    CmbModulo: TwwDBLookupCombo;
    ChkFiltro: TDBCheckBox;
    Bevel3: TBevel;
    Label9: TLabel;
    EdtNomeRelat: TEdit;
    Label5: TLabel;
    MemDescRelats: TMemo;
    wwDBLookupCombo1: TwwDBLookupCombo;
    BtnEtiq: TSpeedButton;
    BtnLista: TSpeedButton;
    BtnColunas: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure BtnProximoClick(Sender: TObject);
    procedure BtnAnteriorClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmbCampoChange(Sender: TObject);
    procedure BtnIncluiClick(Sender: TObject);
    procedure BtnExcluiClick(Sender: TObject);
    procedure BtnPesquisaClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnUpClick(Sender: TObject);
  private
    { Private declarations }
    bModouSql: Boolean;
    function BuscaTipodeDado(TipodeCampo:TFieldType):String;
  public
    { Public declarations }
  end;

var
  FrmAssistenteRelats: TFrmAssistenteRelats;

implementation

Uses FDataDic, FDataDicMT;

{$R *.DFM}

procedure TFrmAssistenteRelats.BtnProximoClick(Sender: TObject);
begin
  TwCons.Etapa.Avancar;
  NtbAssist.PageIndex := TwCons.Etapa.Pos - 1;
end;

procedure TFrmAssistenteRelats.BtnAnteriorClick(Sender: TObject);
begin
  TwCons.Etapa.Retornar;
  NtbAssist.PageIndex := TwCons.Etapa.Pos - 1;
end;

procedure TFrmAssistenteRelats.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  If QryFIelds.Active And QryFIelds.UpdatesPending Then
     QryFIelds.CancelUpdates;
  QryConsultas.Close;
  If QryConsultas.Prepared Then QryConsultas.UnPrepare;
end;

procedure TFrmAssistenteRelats.CmbCampoChange(Sender: TObject);
begin
   If CmbCampo.Text <> '' Then
      EdtTipo.Text := BuscaTipodeDado(QryAux.Fields[CmbCampo.ItemIndex].DataType);
end;

function TFrmAssistenteRelats.BuscaTipodeDado(TipodeCampo:TFieldType):String;
Begin
     Result := 'X';
     Case TipodeCampo of
     ftBoolean,ftString,ftUnknown: Result := 'Caracter';
     ftAutoInc,ftSmallint,ftInteger,ftWord,ftFloat,ftCurrency: Result := 'Numérico';
     ftDate: Result := 'Data';
     ftTime: Result := 'Hora';
     ftDateTime: Result := 'Data\Hora';
     ftBytes,ftVarBytes,ftCursor,ftTypedBinary,ftDBaseOle,ftParadoxOle,
     ftBCD,ftFmtMemo,ftGraphic,ftMemo,ftBlob: Result := 'Blob';
     End;
End;

procedure TFrmAssistenteRelats.BtnIncluiClick(Sender: TObject);
begin
  If (Trim(CmbCampo.Text) = '') Then
      Application.MessageBox('Favor Informar o Campo a ser exportado','Assistente',Mb_IConInformation)
  Else
  Begin
     QryFIelds.Append;
     QryFIelds.Fields[0].AsString  := CmbCampo.Text;
     QryFIelds.Fields[1].AsString  := EdtTipo.Text;
     QryFIelds.Post;
  End;

end;

procedure TFrmAssistenteRelats.BtnExcluiClick(Sender: TObject);
begin
  If Not QryFIelds.IsEmpty Then
     QryFIelds.Delete;
end;

procedure TFrmAssistenteRelats.BtnPesquisaClick(Sender: TObject);
begin
  FrmDataDicMT.ShowModal;
end;

procedure TFrmAssistenteRelats.SpeedButton1Click(Sender: TObject);
begin
  If MsConsulta.Executar = MrOk Then
  Begin
     bModouSql:= True;
     EdtCons.Text := MsConsulta.ValoresChave[2];
     QryConsultas.Close;
     If Not QryConsultas.Prepared Then QryConsultas.Prepare;
     QryConsultas.Params[0].AsInteger := StrToInt(MsConsulta.ValoresChave[0]);
     QryConsultas.Params[1].AsInteger := StrToInt(MsConsulta.ValoresChave[1]);
     QryConsultas.Open;
  End;
end;

procedure TFrmAssistenteRelats.FormShow(Sender: TObject);
begin
  QryFIelds.Open;
  QryFIelds.First;
  QryFIelds.Delete;
  TwCons.Etapa.Pos := 1;
  NtbAssist.PageIndex := 0;
  EdtCons.Text := '';
  If Not QryConsultas.Prepared Then QryConsultas.Prepare;
end;

procedure TFrmAssistenteRelats.BtnUpClick(Sender: TObject);
Var
   iMax, iMin, iIndiceLista, iProximo: Integer;
   sAnterior: String;
begin
   iMax := LstGrupo.Items.Count - 1;
   iMin := 0;
   iIndiceLista := LstGrupo.ItemIndex;
   If (iMax = -1) Or (iIndiceLista = -1) Then Exit;

   If (Sender as TBitBtn).Tag = 1 Then
       iProximo := iIndiceLista - 1
   Else
       iProximo := iIndiceLista + 1;

   If iProximo < iMin Then
      iProximo := iMax
   Else
      If iProximo > iMax Then
         iProximo := iMin;

   sAnterior                    := LstGrupo.Items[iIndiceLista];
   LstGrupo.Items[iIndiceLista] := LstGrupo.Items[iProximo];
   LstGrupo.Items[iProximo]     := sAnterior;
   LstGrupo.SetFocus;
   LstGrupo.ItemIndex := iProximo;
end;

end.



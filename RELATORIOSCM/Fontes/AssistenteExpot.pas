{
  DF 06/07 Gustavo
  Correão do erro "Field TIPOCHAVE is not of expected type":
  Consultas de acesso ao ddfield > Campo "tipochave" foi mudado o tipo
  Fim DF 06/07 Gustavo
}

unit AssistenteExpot;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, TreeWzd, StdCtrls, Buttons, ComCtrls, wwdblook, CMDBLookupCombo,
  Db, DBTables, Wwquery, MontaSelect, Grids, Wwdbigrd, Wwdbgrid, Wwdatsrc,
  TREdit, uSistema, ColorGrd, FFiltraSql, CMwwQuery, DBClient, uCmSqlParams;

type
  TFrmAssistenteExport = class(TForm)
    TwCons: TTreeWzd;
    NtbAssist: TNotebook;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    RbTxt: TRadioButton;
    RbDbf: TRadioButton;
    RbHtml: TRadioButton;
    Bevel1: TBevel;
    QryConsultas: TwwQuery;
    GroupBox1: TGroupBox;
    BtnAnterior: TBitBtn;
    BtnProximo: TBitBtn;
    BtnCancela: TBitBtn;
    BtnEncerra: TBitBtn;
    Label4: TLabel;
    CmbCampo: TComboBox;
    Label5: TLabel;
    Label6: TLabel;
    EdtTipo: TEdit;
    Label7: TLabel;
    CmbFormato: TComboBox;
    BtnInclui: TBitBtn;
    BtnExclui: TBitBtn;
    BtnPesquisa: TBitBtn;
    Bevel2: TBevel;
    MsConsulta: TMontaSelect;
    EdtCons: TEdit;
    SpeedButton1: TSpeedButton;
    wwDBGrid1: TwwDBGrid;
    DsFields: TwwDataSource;
    QryFIelds: TwwQuery;
    UpdFields: TUpdateSQL;
    EdtTam: TRealEdit;
    LstGrupo: TListBox;
    BtnUp: TBitBtn;
    BtnDow: TBitBtn;
    GroupBox2: TGroupBox;
    SpeedButton2: TSpeedButton;
    EdtNome: TEdit;
    DlgFile: TSaveDialog;
    Image4: TImage;
    RbVisualiza: TRadioButton;
    RbEncerra: TRadioButton;
    Label8: TLabel;
    Label9: TLabel;
    NtbParamArq: TNotebook;
    GroupBox3: TGroupBox;
    EdtHeader: TEdit;
    ColorDlg: TColorDialog;
    GroupBox7: TGroupBox;
    EdtEmpresaHtm: TEdit;
    GroupBox9: TGroupBox;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    EdResumo: TMemo;
    EdtFooter: TEdit;
    Label14: TLabel;
    Label15: TLabel;
    EdtMailHtm: TEdit;
    EdtHeaderHtm: TEdit;
    EdtFooterHtm: TEdit;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    RgNomeCor: TRadioGroup;
    Panel8: TPanel;
    SPag: TShape;
    SCorp: TShape;
    SCab: TShape;
    SRod: TShape;
    SCor: TShape;
    SbR: TScrollBar;
    SbG: TScrollBar;
    SbB: TScrollBar;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    CdsAux: TClientDataSet;
    SqlParams: TCMSqlParams;
    procedure BtnProximoClick(Sender: TObject);
    procedure BtnAnteriorClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LabRbTxtel1Click(Sender: TObject);
    procedure NtbAssistPageChanged(Sender: TObject);
    procedure CmbCampoChange(Sender: TObject);
    procedure BtnIncluiClick(Sender: TObject);
    procedure BtnExcluiClick(Sender: TObject);
    procedure BtnPesquisaClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnUpClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Label8Click(Sender: TObject);
    procedure BtnEncerraClick(Sender: TObject);
    procedure SbRScroll(Sender: TObject; ScrollCode: TScrollCode;
      var ScrollPos: Integer);
    procedure RgNomeCorClick(Sender: TObject);
  private
    { Private declarations }
    bModouSql: Boolean;
    sCorPag, sCorCorp, sCorCab, sCorRod: String;
    function BuscaTipodeDado(TipodeCampo:TFieldType):String;
    Function Formatar(SnomeCampo: String;bCampo:Boolean):String;
    Function ZE(N:string; T:Integer):String;
    Function ZD(N:string; T:Integer):String;
    Function AE(S:string; T:Integer):String;
    Function AD(S:string; T:Integer):String;
    Function FiltraRegistrosManual: TFrResult;
    procedure SetasCor;
  public
    { Public declarations }
  end;

var
  FrmAssistenteExport: TFrmAssistenteExport;

implementation

Uses FDataDic, FDataDicMT, uCMFileUtils;

{$R *.DFM}

procedure TFrmAssistenteExport.BtnProximoClick(Sender: TObject);
begin
  TwCons.Etapa.Avancar;
  NtbAssist.PageIndex := TwCons.Etapa.Pos - 1;
end;

procedure TFrmAssistenteExport.BtnAnteriorClick(Sender: TObject);
begin
  TwCons.Etapa.Retornar;
  NtbAssist.PageIndex := TwCons.Etapa.Pos - 1;
end;

procedure TFrmAssistenteExport.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  If QryFIelds.Active And QryFIelds.UpdatesPending Then
     QryFIelds.CancelUpdates;
  QryConsultas.Close;
  If QryConsultas.Prepared Then QryConsultas.UnPrepare;
end;

procedure TFrmAssistenteExport.LabRbTxtel1Click(Sender: TObject);
begin
  Case (Sender as TLabel).Tag of
   1: RbTxt.Checked := True;
   2: RbDbf.Checked := True;
   3: RbHtml.Checked := True;
  End;
end;

procedure TFrmAssistenteExport.NtbAssistPageChanged(Sender: TObject);
Var
  X: Integer;
  sTexto: String;
begin
   Case NtbAssist.PageIndex of
     1:
     Begin

      If (Trim(EdtCons.Text) = '') Or QryConsultas.IsEmpty Then
      Begin
         TwCons.Etapa.Pos := 1;
         NtbAssist.PageIndex := 0;
         Application.MessageBox('Favor Informa a Consulta a ser exportada','Assistente',Mb_IConInformation);
      End;

      If bModouSql Then
      Begin
        Try
           EdtNome.Text := '';
           EdtHeader.Text := '';
           EdtFooter.Text := '';
           EdtHeaderHtm.Text := '';
           EdtFooterHtm.Text := '';
           EdtEmpresaHtm.Text := Sistema.NomeEmpresa;
           EdtMailHtm.Text := '';

           CdsAux.Close;
           SqlParams.SQL.Text := QryConsultas.FieldByName('TEMPLATE').AsString;
           SqlParams.Prepare;
           SqlParams.Open;

           CmbCampo.Items.Clear;

           If QryFIelds.Active And QryFIelds.UpdatesPending Then
           Begin
              QryFIelds.CancelUpdates;
              QryFIelds.Close;
              QryFIelds.Open;
              QryFIelds.First;
              QryFIelds.Delete;
           End;

           For X:=0 To CdsAux.FieldCount - 1 Do
               CmbCampo.Items.Add( CdsAux.Fields[x].DisplayLabel );
        Except
           ShowMessage('Erro ao Abrir Consulta');
           Raise;
           TwCons.Etapa.Pos := 1;
           NtbAssist.PageIndex := 0;
        End;
        bModouSql := False;
      End;
     End;
     2:
     Begin
       If QryFIelds.IsEmpty Then
       Begin
         TwCons.Etapa.Pos := 2;
         NtbAssist.PageIndex := 1;
         Application.MessageBox('Favor Selecionar os Campos a serem esportados','Assistente',Mb_IConInformation);
       End
       Else
       Begin
          LstGrupo.Clear;
          QryFIelds.First;
          While Not QryFIelds.Eof Do
          Begin
            LstGrupo.Items.Add(QryFIelds.Fields[0].AsString);
            QryFIelds.Next;
          End;
       End;
     End;
     3:
     Begin
       With DlgFile Do
       Begin
          InitialDir := ExtractFilePath(Application.Exename);

          If RbTxt.Checked Then
          Begin
           NtbParamArq.PageIndex := 0;
           DefaultExt := 'Txt';
           Title := 'Exportar Para Arquivo Texto';
           Filter := 'Arquivo Texto|*.TXT;Todos Os Arquivos|*.*';
          End
          Else
           If RbDbf.Checked Then
           Begin
              NtbParamArq.PageIndex := 1;
              DefaultExt := 'Dbf';
              Title := 'Exportar Para Arquivo Dbf';
              Filter := 'Arquivo Dbf|*.Dbf';
           End
           Else
           Begin
              NtbParamArq.PageIndex := 2;
              DefaultExt := 'Htm';
              Title := 'Exportar Para Arquivo Html';
              Filter := 'Arquivo Htm|*.Htm;Arquivo Html|*.Html';
           End;
       End;
     End;
     4:
     Begin
       If Trim(EdtNome.Text) = '' Then
       Begin
         TwCons.Etapa.Pos := 4;
         NtbAssist.PageIndex := 3;
         Application.MessageBox('Favor Selecionar o arquivo de destino','Assistente',Mb_IConInformation);
       End
       Else
       Begin
          EdResumo.Lines.Clear;
          EdResumo.Lines.Add('Configurações Para Exportação');
          EdResumo.Lines.Add('');
          EdResumo.Lines.Add('Opção: ' + DlgFile.Title);

          EdResumo.Lines.Add('');
          EdResumo.Lines.Add('Arquivo de Saída');
          EdResumo.Lines.Add(EdtNome.Text);

          EdResumo.Lines.Add('');
          EdResumo.Lines.Add('Campos Selecionados Para Exportação');

          QryFIelds.First;
          While Not QryFields.Eof Do
          Begin
             For X:=0 To QryFields.FieldCount - 1 Do
                 If X = 0 Then
                   EdResumo.Lines.Add(QryFields.Fields[X].AsString)
                 Else
                   EdResumo.Lines.Add(' > ' + QryFields.Fields[X].AsString);
             QryFields.Next;
          End;

          EdResumo.Lines.Add('');
          EdResumo.Lines.Add('Ordem Dos Campos Selecionados');
          sTexto := '';
          For X:=0 To LstGrupo.Items.Count - 1 Do
              sTexto := sTexto + LstGrupo.Items[X] + ',';
          EdResumo.Lines.Add(Copy(sTexto,1,Length(Stexto)-1));

          EdResumo.Lines.Insert(0,'')
       End;
     End;
   End;
end;

procedure TFrmAssistenteExport.CmbCampoChange(Sender: TObject);
begin
   If CmbCampo.Text <> '' Then
   Begin
      EdtTam.Value := CdsAux.Fields[CmbCampo.ItemIndex].Size;
      EdtTipo.Text := BuscaTipodeDado(CdsAux.Fields[CmbCampo.ItemIndex].DataType);
   End;
end;

function TFrmAssistenteExport.BuscaTipodeDado(TipodeCampo:TFieldType):String;
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

procedure TFrmAssistenteExport.BtnIncluiClick(Sender: TObject);
begin
  If (Trim(CmbCampo.Text) = '') Then
      Application.MessageBox('Favor Informar o Campo a ser exportado','Assistente',Mb_IConInformation)
  Else
  Begin
     If (EdtTam.Value = 0) Then
        Application.MessageBox('Favor Informar o Tamanho do Campo a ser exportado','Assistente',Mb_IConInformation)
     Else
     If (Trim(CmbFormato.Text) = '') Then
        Application.MessageBox('Favor Informar o Formato do Campo a ser exportado','Assistente',Mb_IConInformation)
     Else
     Begin
        QryFIelds.Append;
        QryFIelds.Fields[0].AsString  := CmbCampo.Text;
        QryFIelds.Fields[1].AsInteger := StrToInt(EdtTam.Text);
        QryFIelds.Fields[2].AsString  := EdtTipo.Text;
        QryFIelds.Fields[3].AsString  := CmbFormato.Text;
        QryFIelds.Post;
     End;
  End;
end;

procedure TFrmAssistenteExport.BtnExcluiClick(Sender: TObject);
begin
  If Not QryFIelds.IsEmpty Then
     QryFIelds.Delete;
end;

procedure TFrmAssistenteExport.BtnPesquisaClick(Sender: TObject);
begin
  FrmDataDicMT.ShowModal;
end;

procedure TFrmAssistenteExport.SpeedButton1Click(Sender: TObject);
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

procedure TFrmAssistenteExport.FormShow(Sender: TObject);
begin
  QryFields.Open;
  QryFields.First;
  QryFields.Delete;
  TwCons.Etapa.Pos := 1;
  NtbAssist.PageIndex := 0;
  EdtCons.Text := '';
  If Not QryConsultas.Prepared Then QryConsultas.Prepare;
  sCorPag  := 'FFFFFF';
  sCorCorp := '000000';
  sCorCab  := '000000';
  sCorRod  := '000000';
end;

procedure TFrmAssistenteExport.BtnUpClick(Sender: TObject);
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

procedure TFrmAssistenteExport.SpeedButton2Click(Sender: TObject);
begin
  If DlgFile.Execute Then
     EdtNome.Text := DlgFile.Filename
  Else
     EdtNome.Text := '';
end;

procedure TFrmAssistenteExport.Label8Click(Sender: TObject);
begin
  Case (Sender as TLabel).Tag of
   1: RbVisualiza.Checked := True;
   2: RbEncerra.Checked := True;
  End;
end;

procedure TFrmAssistenteExport.BtnEncerraClick(Sender: TObject);
Var
  Texto:TextFile;
  X: Integer;
  sTexto: String;
  T: TTable;
begin

  If NtbAssist.PageIndex = 4 Then
  Begin

   If Trim(EdtNome.Text) = '' Then
   Begin
     TwCons.Etapa.Pos := 4;
     NtbAssist.PageIndex := 3;
     Exit;
   End;

   If FiltraRegistrosManual = FrError Then Exit;

   Repaint;

   If Not CdsAux.Active Then
      SqlParams.Open;

   CdsAux.First;

   If RbTxt.Checked Then
   Begin
     AssignFile(Texto,EdtNome.Text);
     Rewrite(Texto);

     If EdtHeader.Text <> '' Then
        WriteLn(Texto,EdtHeader.Text);

     While Not CdsAux.Eof Do
     Begin
       sTexto := '';
       For X:=0 To LstGrupo.Items.Count - 1 Do
           sTexto := sTexto + Formatar(LstGrupo.Items[X],True);
       WriteLn(Texto,sTexto);
       CdsAux.Next;
     End;

     If EdtHeader.Text <> '' Then
        WriteLn(Texto,EdtFooter.Text);

     CloseFile(Texto);
   End
     Else
     If RbDbf.Checked Then
     Begin
         If FileExists(EdtNome.Text) Then DeleteFile(EdtNome.Text);
         T := TTable.Create( Application );
         T.Active       := False;
         T.TableType    := ttDBase;
         T.TableName    := EdtNome.Text;
         T.FieldDefs.Clear;
         For X:=0 To LstGrupo.Items.Count - 1 Do
         Begin
             QryFields.Locate('CAMPO',LstGrupo.Items[X],[]);
             T.FieldDefs.add(Copy(LstGrupo.Items[X],1,8) + IntToStr(X),
                             CdsAux.FieldByName(LstGrupo.Items[X]).DataType,
                             CdsAux.FieldByName(LstGrupo.Items[X]).Size,
                             False );
         End;
         T.CreateTable;
         T.Open;
         While Not CdsAux.Eof Do
         Begin
           T.Append;
           For X:=0 To LstGrupo.Items.Count - 1 Do
               T.FieldByName(Copy(LstGrupo.Items[X],1,8) + IntToStr(X)).Value :=
               CdsAux.FieldByName(LstGrupo.Items[X]).Value;
           T.Post;
           CdsAux.Next;
         End;
         CdsAux.Close;
         T.Close;
     End
     Else
     Begin
        AssignFile(Texto,EdtNome.Text);
        Rewrite(Texto);

        WriteLn(Texto,'<HTML>');
        WriteLn(Texto,'<HEAD>');
        WriteLn(Texto,'<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=windows-1252">');
        WriteLn(Texto,'<META NAME="Generator" CONTENT="Gerador de Relatórios - Cm Soluções">');
        WriteLn(Texto,'<TITLE>');
        WriteLn(Texto,EdtHeader.Text);
        WriteLn(Texto,'</TITLE>');
        WriteLn(Texto,'</HEAD>');
        WriteLn(Texto,'<BODY>');

        WriteLn(Texto,'<BODY BGCOLOR= "#' + sCorPag + '">');
        WriteLn(Texto,'<P ALIGN="CENTER">');
        If Trim(EdtEmpresaHtm.Text) <> '' Then
        Begin
           WriteLn(Texto,'<FONT SIZE=6>');
           WriteLn(Texto,'<FONT COLOR= "#' + sCorCab + '">');
           WriteLn(Texto,EdtEmpresaHtm.Text);
           WriteLn(Texto,'</FONT>');
           WriteLn(Texto,'<BR>');
        End;

        If Trim(EdtMailHtm.Text) <> '' Then
        Begin
           WriteLn(Texto,'<A HREF="mailto:' + EdtMailHtm.Text + '"><FONT SIZE=2>' + EdtMailHtm.Text + '</FONT></A>');
           WriteLn(Texto,'<BR>');
        End;

        WriteLn(Texto,'</P>');


        WriteLn(Texto,'<P ALIGN="CENTER">');
        WriteLn(Texto,'<FONT SIZE=4>');
        WriteLn(Texto,'<FONT COLOR= "#' + sCorCab + '">');
        WriteLn(Texto,EdtHeaderHtm.Text);
        WriteLn(Texto,'</P>');
        WriteLn(Texto,'</FONT>');

        WriteLn(Texto,'<HR ALIGN="RIGHT" SIZE=1>');
        WriteLn(Texto,'<FONT SIZE=2>');
        WriteLn(Texto,'<FONT COLOR= "#' + sCorCorp + '">');

        WriteLn(Texto,'<P></P>');

        WriteLn(Texto,'<TABLE>');

        WriteLn(Texto,'<TR>');
        For X:=0 To LstGrupo.Items.Count - 1 Do
        Begin
           WriteLn(Texto,'<TD>');
           WriteLn(Texto,LstGrupo.Items[X]);
           WriteLn(Texto,'</TD>');

        End;
        WriteLn(Texto,'</TR>');

        While Not CdsAux.Eof Do
        Begin
          WriteLn(Texto,'<TR>');
          For X:=0 To LstGrupo.Items.Count - 1 Do
          Begin
             WriteLn(Texto,'<TD>');
             WriteLn(Texto,LstGrupo.Items[X]);
             WriteLn(Texto,'</TD>');
          End;
          WriteLn(Texto,'</TR>');
          CdsAux.Next;
        End;
        WriteLn(Texto,'</TABLE>');

        WriteLn(Texto,'<P></P>');
        WriteLn(Texto,'<HR ALIGN="RIGHT" SIZE=1>');
        WriteLn(Texto,'<P ALIGN="CENTER">');
        WriteLn(Texto,'<FONT COLOR= "#' + sCorRod + '">');
        WriteLn(Texto,EdtFooterHtm.Text);
        WriteLn(Texto,'</P>');
        WriteLn(Texto,'</FONT>');
        WriteLn(Texto,'</BODY>');
        WriteLn(Texto,'</HTML>');

        CloseFile(Texto);
     End;

     If RbVisualiza.Checked Then
        ShellExecuteFile(EdtNome.Text,'','',SW_SHOW);
        
     Application.ProcessMessages;

     Close;
   End;
end;

Function TFrmAssistenteExport.Formatar(SnomeCampo: String;bCampo:Boolean):String;
Var
  iTam: Integer;
Begin
  QryFields.Locate('CAMPO',sNomeCampo,[]);
  iTam := QryFields.FieldByName('TAMANHO').AsInteger;

  If bCampo Then
  Begin
    If QryFields.FieldByName('MASCARA').AsString = 'Alinhado a Direita' Then
       Result := AD(CdsAux.FieldByName(SnomeCampo).AsString,iTam)
    Else
       If QryFields.FieldByName('MASCARA').AsString = 'Alinhado a Esquerda' Then
          Result := AE(CdsAux.FieldByName(SnomeCampo).AsString,iTam)
       Else
       If QryFields.FieldByName('MASCARA').AsString = 'Zeros a Esquerda' Then
          Result := ZE(CdsAux.FieldByName(SnomeCampo).AsString,iTam)
       Else
          Result := ZD(CdsAux.FieldByName(SnomeCampo).AsString,iTam);
  End
  Else
    Result := AE(SnomeCampo,iTam);

End;

Function TFrmAssistenteExport.AD(S:string; T:Integer):String;
var temp:string;
    cont:Integer;
Begin
     temp := Trim(s);

     If length(Temp) > T Then
        temp := Copy(Temp,1,T);

     for cont:=1 to t - length(temp) do
        temp:=' '+temp;

     result := temp;
end;

Function TFrmAssistenteExport.AE(S:string; T:Integer):String;
var temp:string;
    cont:Integer;
Begin
   temp := Trim(s);

   If length(Temp) > T Then
        temp := Copy(Temp,1,T);

   for cont:=1 to t - length(temp) do
       temp:=temp+' ';

   result := temp;
end;

Function TFrmAssistenteExport.ZD(N:string; T:Integer):String;
var temp:string;
    cont, Tam:Integer;
Begin
     temp := Trim(temp);

     If length(Temp) > T Then
        temp := Copy(Temp,1,T);

     Tam := length(temp);

     for cont:=1 to t - Tam do
         temp:='0'+temp;

     result := temp;
end;

Function TFrmAssistenteExport.ZE(N:string; T:Integer):String;
var temp:string;
    cont, Tam:Integer;
Begin
     temp := Trim(temp);

     If length(Temp) > T Then
        temp := Copy(Temp,1,T);

     Tam := length(temp);

     for cont:=1 to t - Tam do
         temp:=temp+'0';

     result := temp;
end;

Function TFrmAssistenteExport.FiltraRegistrosManual: TFrResult;
Var
  FrmFiltraSql: TFrmFiltraSql;
Begin
     Try
      CdsAux.Close;
      CdsAux.Filtered := False;
      CdsAux.FilterOptions := [];
      CdsAux.Filter := '';

      Application.CreateForm(TFrmFiltraSql,FrmFiltraSql);
      FrmFiltraSql.CdsOrigem := CdsAux;

      Case FrmFiltraSql.ShowModal of
        MrOk:    Result := FrFiltrado;
        MrAbort: Result := FrError;
      Else
                 Result := FrFull;
      End;

      FrmFiltraSql.Free;

     Except
      Result := FrError;
      If CdsAux.Active Then
         CdsAux.Close;
      CdsAux.Filtered := False;
      CdsAux.FilterOptions := [];
      CdsAux.Filter := '';
      FrmFiltraSql.Free;
     End;
end;


procedure TFrmAssistenteExport.SbRScroll(Sender: TObject;
  ScrollCode: TScrollCode; var ScrollPos: Integer);
begin
  SetasCor;
end;

procedure TFrmAssistenteExport.RgNomeCorClick(Sender: TObject);
Var
  iCor :LongInt;
begin
  iCor := 0;

  Case RgNomeCor.ItemIndex of
     0: iCor := ColorToRgb(sPag.Brush.Color);
     1: iCor := ColorToRgb(sCorp.Brush.Color);
     2: iCor := ColorToRgb(sCab.Brush.Color);
     3: iCor := ColorToRgb(sRod.Brush.Color);
  End;

  sbr.Position := GetrValue(iCor);
  Sbg.Position := GetgValue(iCor);
  sbb.Position := GetbValue(iCor);

  SetasCor  
end;

procedure TFrmAssistenteExport.SetasCor;
Begin
   sCor.Brush.Color := Rgb(sbr.Position,Sbg.Position,sbb.Position);
   Case RgNomeCor.ItemIndex of
       0:
       Begin
         sPag.Brush.Color := sCor.Brush.Color;
         sCorPag := Copy(IntToHex(sbr.Position,2),1,2) + Copy(IntToHex(sbg.Position,2),1,2) + Copy(IntToHex(sbb.Position,2),1,2);
       End;
       1:
       Begin
         sCorp.Brush.Color := sCor.Brush.Color;
         sCorCorp := Copy(IntToHex(sbr.Position,2),1,2) + Copy(IntToHex(sbg.Position,2),1,2) + Copy(IntToHex(sbb.Position,2),1,2);
       End;
       2:
       Begin
         sCab.Brush.Color := sCor.Brush.Color;
         sCorCab := Copy(IntToHex(sbr.Position,2),1,2) + Copy(IntToHex(sbg.Position,2),1,2) + Copy(IntToHex(sbb.Position,2),1,2);
       End;
       3:
       Begin
         sRod.Brush.Color := sCor.Brush.Color;
         sCorRod := Copy(IntToHex(sbr.Position,2),1,2) + Copy(IntToHex(sbg.Position,2),1,2) + Copy(IntToHex(sbb.Position,2),1,2);
       End;
   End;
End;

end.



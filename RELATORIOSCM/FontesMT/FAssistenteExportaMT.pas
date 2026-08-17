unit FAssistenteExportaMT;

{
Rotina.............: RemoveWhere, RetornaWhere, FiltraRegistrosManual, BtnEncerraClick
N. Sol.............: 116922
N. Kintana.........: 558954
Data...............: 09/07/2009
Responsável........: Ricardo Alves
Descrição..........: Corrigido bug na escolha do combo Campos Para Pesquisa da janela
  Filtra Consulta do Assistente de Exportação de consultas para txt.
}
{------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FPAI, IvDictio, IvMulti, IvEMulti, DBTables, Db, DBClient, StdCtrls, TreeWzd,
  MontaSelect, uCmSqlParams, ExtCtrls, TREdit, Grids, Wwdbgrid, Wwdbigrd,
  FFiltraSql, Buttons, uCtrlDataview;

type
  TFrmAssistenteExport = class(TfrmPai)
    NtbAssist: TNotebook;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    RbTxt: TRadioButton;
    RbDbf: TRadioButton;
    RbHtml: TRadioButton;
    GroupBox1: TGroupBox;
    SpeedButton1: TSpeedButton;
    EdtCons: TEdit;
    Panel3: TPanel;
    Panel4: TPanel;
    Bevel2: TBevel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    CmbCampo: TComboBox;
    EdtTipo: TEdit;
    CmbFormato: TComboBox;
    BtnInclui: TBitBtn;
    BtnExclui: TBitBtn;
    BtnPesquisa: TBitBtn;
    wwDBGrid1: TwwDBGrid;
    EdtTam: TRealEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    LstGrupo: TListBox;
    BtnUp: TBitBtn;
    BtnDow: TBitBtn;
    Panel5: TPanel;
    GroupBox2: TGroupBox;
    SpeedButton2: TSpeedButton;
    EdtNome: TEdit;
    NtbParamArq: TNotebook;
    GroupBox3: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    EdtHeader: TEdit;
    EdtFooter: TEdit;
    GroupBox7: TGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    EdtEmpresaHtm: TEdit;
    EdtMailHtm: TEdit;
    EdtHeaderHtm: TEdit;
    EdtFooterHtm: TEdit;
    GroupBox9: TGroupBox;
    SCor: TShape;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    RgNomeCor: TRadioGroup;
    Panel8: TPanel;
    SPag: TShape;
    SCorp: TShape;
    SCab: TShape;
    SRod: TShape;
    SbR: TScrollBar;
    SbG: TScrollBar;
    SbB: TScrollBar;
    Panel6: TPanel;
    Image4: TImage;
    Label8: TLabel;
    Label9: TLabel;
    RbVisualiza: TRadioButton;
    RbEncerra: TRadioButton;
    Panel7: TPanel;
    EdResumo: TMemo;
    TwCons: TTreeWzd;
    BtnAnterior: TBitBtn;
    BtnProximo: TBitBtn;
    BtnCancela: TBitBtn;
    BtnEncerra: TBitBtn;
    ColorDlg: TColorDialog;
    DlgFile: TSaveDialog;
    SqlParams: TCMSqlParams;
    MsConsulta: TMontaSelect;
    CdsAux: TClientDataSet;
    CdsFields: TClientDataSet;
    CdsConsulta: TClientDataSet;
    DsFields: TDataSource;
    SqlParFields: TCMSqlParams;
    Label13: TLabel;
    Label20: TLabel;
    procedure LabRbTxtel1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnProximoClick(Sender: TObject);
    procedure BtnAnteriorClick(Sender: TObject);
    procedure NtbAssistPageChanged(Sender: TObject);
    procedure CmbCampoChange(Sender: TObject);
    procedure BtnIncluiClick(Sender: TObject);
    procedure BtnExcluiClick(Sender: TObject);
    procedure BtnPesquisaClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
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
    function BuscaTipodeDado( TipodeCampo: TFieldType ): String;
    Function Formatar( SnomeCampo: String; bCampo: Boolean ): String;
    Function Ajusta( Str: String; Tam: Integer; StrFill: String = ' '; besq: Boolean = True ): String;
    Function FiltraRegistrosManual: TFrResult;
    procedure SetasCor;

    // Ricardo A. SOL: 116922 KTN: 558954
    procedure RemoveWhere();
    procedure RetornaWhere();
  public
    { Public declarations }

    // Ricardo A. SOL: 116922 KTN: 558954
    FAntigoWhere: string;
    FOrderBy: string;
    FNovasCondicoes: string;


    Dataview: TCtrlDataview;
  end;

var
  FrmAssistenteExport: TFrmAssistenteExport;

implementation

uses DBaseDados, FDataDicMT, uSistema, uCMFileUtils;

{$R *.DFM}

function TFrmAssistenteExport.BuscaTipodeDado( TipodeCampo: TFieldType ): String;
Begin
  Result := 'X';

  Case TipodeCampo of
       ftBoolean, ftString, ftUnknown: Result := 'Caracter';
       ftAutoInc, ftSmallint, ftInteger, ftWord, ftFloat, ftCurrency: Result := 'Numérico';
       ftDate: Result := 'Data';
       ftTime: Result := 'Hora';
       ftDateTime: Result := 'Data/Hora';
       ftBytes, ftVarBytes, ftCursor, ftTypedBinary, ftDBaseOle, ftParadoxOle,
           ftBCD, ftFmtMemo, ftGraphic, ftMemo, ftBlob: Result := 'Blob';
  End;
End;

Function TFrmAssistenteExport.Formatar(SnomeCampo: String; bCampo: Boolean): String;
Var
  iTam: Integer;
Begin
  CdsFields.Locate( 'CAMPO', sNomeCampo, [] );
  iTam := CdsFields.FieldByName( 'TAMANHO' ).AsInteger;

  If bCampo Then Begin
     If CdsFields.FieldByName( 'MASCARA' ).AsString = 'Alinhado a Direita' Then
        Result := Ajusta( CdsAux.FieldByName( SnomeCampo ).AsString, iTam, ' ', False )
     Else
        If CdsFields.FieldByName( 'MASCARA' ).AsString = 'Alinhado a Esquerda' Then
           Result := Ajusta( CdsAux.FieldByName( SnomeCampo ).AsString, iTam, ' ', True )
        Else
           If CdsFields.FieldByName( 'MASCARA' ).AsString = 'Zeros a Esquerda' Then
              Result := Ajusta( CdsAux.FieldByName( SnomeCampo ).AsString, iTam, '0', True )
           Else
              Result := Ajusta( CdsAux.FieldByName( SnomeCampo ).AsString, iTam, '0', False );
  End Else
     Result := Ajusta( SnomeCampo, iTam, ' ', True );
End;

Function TFrmAssistenteExport.Ajusta( Str: String; Tam: Integer; StrFill: String = ' ';
         besq: Boolean = True ): String;
var
  cont, tam2: Integer;
  temp: String;
Begin
  temp := Trim( str );

  If Length( temp ) > tam Then
     temp := Trim( Copy( temp, 1, tam ) );

  tam2 := Length( temp );

  For cont := 1 To tam - tam2 Do
      If besq Then
         temp := strfill + temp
      Else
         temp := temp + strfill;

  Result := temp;
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

     Application.CreateForm( TFrmFiltraSql, FrmFiltraSql );

     // Ricardo A. SOL: 116922 KTN: 558954
//     FrmFiltraSql.CdsOrigem := CdsAux;

     FNovasCondicoes := '';

     FrmFiltraSql.SQLOrigem.SQL := SqlParams.SQL;
                                                              
     Case FrmFiltraSql.ShowModal of
          MrOk:
          begin
            Result := FrFiltrado;
            FNovasCondicoes := FrmFiltraSql.sCondicoes;
          end;
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

procedure TFrmAssistenteExport.SetasCor;
Begin
  sCor.Brush.Color := Rgb( sbr.Position, Sbg.Position, sbb.Position );

  Case RgNomeCor.ItemIndex of
       0: Begin
          sPag.Brush.Color := sCor.Brush.Color;
          sCorPag := Copy( IntToHex( sbr.Position, 2 ), 1, 2 ) +
                     Copy( IntToHex( sbg.Position, 2 ), 1, 2 ) +
                     Copy( IntToHex( sbb.Position, 2 ), 1, 2 );
       End;

       1: Begin
          sCorp.Brush.Color := sCor.Brush.Color;
          sCorCorp := Copy( IntToHex( sbr.Position, 2 ), 1, 2 ) +
                      Copy( IntToHex( sbg.Position, 2 ), 1, 2 ) +
                      Copy( IntToHex( sbb.Position, 2 ), 1, 2 );
       End;

       2: Begin
          sCab.Brush.Color := sCor.Brush.Color;
          sCorCab := Copy( IntToHex( sbr.Position, 2 ), 1, 2 ) +
                     Copy( IntToHex( sbg.Position, 2 ), 1, 2 ) +
                     Copy( IntToHex( sbb.Position, 2 ), 1, 2 );
       End;

       3: Begin
          sRod.Brush.Color := sCor.Brush.Color;
          sCorRod := Copy( IntToHex( sbr.Position, 2 ), 1, 2 ) +
                     Copy( IntToHex( sbg.Position, 2 ), 1, 2 ) +
                     Copy( IntToHex( sbb.Position, 2 ), 1, 2 );
       End;
  End;
End;

procedure TFrmAssistenteExport.FormCreate(Sender: TObject);
begin
  inherited;
  DataView := TCtrlDataview.Create;
  Dataview.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                       Sistema.ConnectionSide, Sistema.AppRemoteServer, True );
  CdsConsulta.Data := Dataview.ListaDataview( -1, -1 );
end;

procedure TFrmAssistenteExport.FormShow(Sender: TObject);
begin
  SqlParFields.Open;   
  CdsFields.First;
  CdsFields.Delete;
  TwCons.Etapa.Pos := 1;
  NtbAssist.PageIndex := 0;
  EdtCons.Text := '';

  sCorPag  := 'FFFFFF';
  sCorCorp := '000000';
  sCorCab  := '000000';
  sCorRod  := '000000';
end;

procedure TFrmAssistenteExport.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CdsFields.Close;
  CdsConsulta.Close;
  Dataview.Free;
end;

procedure TFrmAssistenteExport.BtnProximoClick(Sender: TObject);
begin
  inherited;
  TwCons.Etapa.Avancar;
  NtbAssist.PageIndex := TwCons.Etapa.Pos - 1;
end;

procedure TFrmAssistenteExport.BtnAnteriorClick(Sender: TObject);
begin
  inherited;
  TwCons.Etapa.Retornar;
  NtbAssist.PageIndex := TwCons.Etapa.Pos - 1;
end;

procedure TFrmAssistenteExport.NtbAssistPageChanged(Sender: TObject);
Var
  X: Integer;
  sTexto: String;
begin
  inherited;
  Case NtbAssist.PageIndex of
       1: Begin
          If ( Trim( EdtCons.Text ) = '' ) Or CdsConsulta.IsEmpty Then Begin
             TwCons.Etapa.Pos := 1;
             NtbAssist.PageIndex := 0;
             Application.MessageBox( 'Favor Informa a Consulta a ser exportada', 'Assistente', Mb_IConInformation );
          End;

          If bModouSql Then Begin
             Try
                EdtNome.Text       := '';
                EdtHeader.Text     := '';
                EdtFooter.Text     := '';
                EdtHeaderHtm.Text  := '';
                EdtFooterHtm.Text  := '';
                EdtEmpresaHtm.Text := Sistema.NomeEmpresa;
                EdtMailHtm.Text    := '';

                // Ricardo A. SOL: 116922 KTN: 558954
                CdsAux.Close;
                SqlParams.SQL.Text := 'SELECT * FROM (' + CdsConsulta.FieldByName( 'TEMPLATE' ).AsString +
                  ') WHERE (0=1)';
                SqlParams.Prepare;
                SqlParams.Open;

                CmbCampo.Items.Clear;

                If CdsFields.Active Then Begin
                   CdsFields.Close;
                   SqlParFields.Open;
                   CdsFields.First;
                   CdsFields.Delete;
                End;

                For X := 0 To CdsAux.FieldCount - 1 Do
                    CmbCampo.Items.Add( CdsAux.Fields[ x ].DisplayLabel );
             Except
                ShowMessage('Erro ao Abrir Consulta');
                Raise;
                TwCons.Etapa.Pos    := 1;
                NtbAssist.PageIndex := 0;
             End;

             SqlParams.SQL.Text := CdsConsulta.FieldByName( 'TEMPLATE' ).AsString;

             bModouSql := False;
          End;
       End;

       2: Begin
          If CdsFields.IsEmpty Then Begin
             TwCons.Etapa.Pos    := 2;
             NtbAssist.PageIndex := 1;
             Application.MessageBox( 'Favor Selecionar os Campos a serem esportados',
                                     'Assistente', Mb_IConInformation );
          End Else Begin
             LstGrupo.Clear;
             CdsFields.First;

             While Not CdsFields.Eof Do Begin
                   LstGrupo.Items.Add( CdsFields.Fields[ 0 ].AsString );
                   CdsFields.Next;
             End;
          End;
       End;

       3: Begin
          With DlgFile Do Begin
               InitialDir := ExtractFilePath(Application.Exename);

               If RbTxt.Checked Then Begin
                  NtbParamArq.PageIndex := 0;
                  DefaultExt := 'Txt';
                  Title      := 'Exportar Para Arquivo Texto';
                  Filter     := 'Arquivo Texto|*.TXT;Todos Os Arquivos|*.*';
               End Else
                  If RbDbf.Checked Then Begin
                     NtbParamArq.PageIndex := 1;
                     DefaultExt := 'Dbf';
                     Title      := 'Exportar Para Arquivo Dbf';
                     Filter     := 'Arquivo Dbf|*.Dbf';
                  End Else Begin
                     NtbParamArq.PageIndex := 2;
                     DefaultExt := 'Htm';
                     Title      := 'Exportar Para Arquivo Html';
                     Filter     := 'Arquivo Htm|*.Htm;Arquivo Html|*.Html';
                  End;
          End;
       End;

       4: Begin
          If Trim(EdtNome.Text) = '' Then Begin
             TwCons.Etapa.Pos    := 4;
             NtbAssist.PageIndex := 3;
             Application.MessageBox( 'Favor Selecionar o arquivo de destino',
                                     'Assistente', Mb_IConInformation );
          End Else Begin
             EdResumo.Lines.Clear;
             EdResumo.Lines.Add( 'Configurações Para Exportação' );
             EdResumo.Lines.Add( '' );
             EdResumo.Lines.Add( 'Opção: ' + DlgFile.Title );

             EdResumo.Lines.Add( '' );
             EdResumo.Lines.Add( 'Arquivo de Saída' );
             EdResumo.Lines.Add( EdtNome.Text );

             EdResumo.Lines.Add( '' );
             EdResumo.Lines.Add( 'Campos Selecionados Para Exportação' );
             CdsFields.First;

             While Not CdsFields.Eof Do Begin
                   For x := 0 To CdsFields.FieldCount - 1 Do
                       If x = 0 Then
                          EdResumo.Lines.Add( CdsFields.Fields[ x ].AsString )
                       Else
                          EdResumo.Lines.Add( ' > ' + CdsFields.Fields[ x ].AsString );

                   CdsFields.Next;
             End;

             EdResumo.Lines.Add( '' );
             EdResumo.Lines.Add( 'Ordem Dos Campos Selecionados' );
             sTexto := '';

             For x := 0 To LstGrupo.Items.Count - 1 Do
                 sTexto := sTexto + LstGrupo.Items[ x ] + ',';

             EdResumo.Lines.Add( Copy( sTexto, 1, Length( Stexto ) - 1 ) );
             EdResumo.Lines.Insert( 0, '' );
          End;
       End;
  End;

  BtnAnterior.Enabled := ( NtbAssist.PageIndex <> 0 );
  BtnProximo.Enabled  := ( NtbAssist.PageIndex <> 4 );
end;

procedure TFrmAssistenteExport.LabRbTxtel1Click(Sender: TObject);
begin
  Case ( Sender As TComponent ).Tag Of
       1: RbTxt.Checked  := True;
       2: RbDbf.Checked  := True;
       3: RbHtml.Checked := True;
  End;
end;

procedure TFrmAssistenteExport.CmbCampoChange(Sender: TObject);
begin
  inherited;
  If CmbCampo.Text <> '' Then Begin
     EdtTam.Value := CdsAux.Fields[ CmbCampo.ItemIndex ].Size;
     EdtTipo.Text := BuscaTipodeDado( CdsAux.Fields[ CmbCampo.ItemIndex ].DataType );
  End;
end;

procedure TFrmAssistenteExport.BtnIncluiClick(Sender: TObject);
begin
  inherited;
  If Trim( CmbCampo.Text ) = '' Then
     Application.MessageBox( 'Favor Informar o Campo a ser exportado',
                             'Assistente', Mb_IConInformation )
  Else Begin
     If EdtTam.Value = 0 Then
        Application.MessageBox( 'Favor Informar o Tamanho do Campo a ser exportado',
                                'Assistente', Mb_IConInformation )
     Else
        If Trim( CmbFormato.Text ) = '' Then
           Application.MessageBox( 'Favor Informar o Formato do Campo a ser exportado',
                                   'Assistente', Mb_IConInformation )
        Else Begin
           CdsFields.Append;
           CdsFields.Fields[ 0 ].AsString  := CmbCampo.Text;
           CdsFields.Fields[ 1 ].AsInteger := StrToInt( EdtTam.Text );
           CdsFields.Fields[ 2 ].AsString  := EdtTipo.Text;
           CdsFields.Fields[ 3 ].AsString  := CmbFormato.Text;
           CdsFields.Post;
        End;
  End;
end;

procedure TFrmAssistenteExport.BtnExcluiClick(Sender: TObject);
begin
  inherited;
  If Not CdsFields.IsEmpty Then
     CdsFields.Delete;
end;

procedure TFrmAssistenteExport.BtnPesquisaClick(Sender: TObject);
begin
  inherited;
  FrmDataDic.ShowModal;
end;

procedure TFrmAssistenteExport.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  If MsConsulta.Executar = MrOk Then Begin
     bModouSql    := True;
     EdtCons.Text := MsConsulta.ValoresChave[ 2 ];
     CdsConsulta.Data := Dataview.ListaDataview( StrToInt( MsConsulta.ValoresChave[ 0 ] )
                                                 StrToInt( MsConsulta.ValoresChave[ 1 ] ) );
  End;
end;

procedure TFrmAssistenteExport.BtnUpClick(Sender: TObject);
Var
  iMax, iMin, iIndiceLista, iProximo: Integer;
  sAnterior: String;
begin
  inherited;
  iMax := LstGrupo.Items.Count - 1;
  iMin := 0;
  iIndiceLista := LstGrupo.ItemIndex;

  If ( iMax = -1 ) Or ( iIndiceLista = -1 ) Then
     Exit;

  If (Sender as TBitBtn).Tag = 1 Then
     iProximo := iIndiceLista - 1
  Else
     iProximo := iIndiceLista + 1;

  If iProximo < iMin Then
     iProximo := iMax
  Else
     If iProximo > iMax Then
        iProximo := iMin;

  sAnterior                      := LstGrupo.Items[ iIndiceLista ];
  LstGrupo.Items[ iIndiceLista ] := LstGrupo.Items[ iProximo ];
  LstGrupo.Items[ iProximo ]     := sAnterior;
  LstGrupo.SetFocus;
  LstGrupo.ItemIndex := iProximo;
end;

procedure TFrmAssistenteExport.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  If DlgFile.Execute Then
     EdtNome.Text := DlgFile.Filename
  Else
     EdtNome.Text := '';
end;

procedure TFrmAssistenteExport.Label8Click(Sender: TObject);
begin
  inherited;
  Case ( Sender as TLabel ).Tag of
       1: RbVisualiza.Checked := True;
       2: RbEncerra.Checked   := True;
  End;
end;

procedure TFrmAssistenteExport.BtnEncerraClick(Sender: TObject);
Var
  x: Integer;
  Texto: TextFile;
  sTexto: String;
  T: TTable;
begin
  inherited;
  If NtbAssist.PageIndex = 4 Then Begin
     If Trim( EdtNome.Text ) = '' Then Begin
        TwCons.Etapa.Pos    := 4;
        NtbAssist.PageIndex := 3;
        Exit;
     End;
     // Ricardo A. SOL: 116922 KTN: 558954
     RemoveWhere;
     If FiltraRegistrosManual = FrError Then
        Exit;

     RetornaWhere;
     Repaint;

     If Not CdsAux.Active Then
        SqlParams.Open;

     CdsAux.First;

     If RbTxt.Checked Then Begin
        AssignFile( Texto, EdtNome.Text );
        Rewrite( Texto );

        If EdtHeader.Text <> '' Then
           WriteLn( Texto, EdtHeader.Text );

        While Not CdsAux.Eof Do Begin
              sTexto := '';

              For x := 0 To LstGrupo.Items.Count - 1 Do
                  sTexto := sTexto + Formatar( LstGrupo.Items[ x ], True );

              WriteLn( Texto, sTexto );
              CdsAux.Next;
        End;

        If EdtHeader.Text <> '' Then
           WriteLn( Texto, EdtFooter.Text );

        CloseFile( Texto );
     End Else
        If RbDbf.Checked Then Begin
           If FileExists( EdtNome.Text ) Then
              DeleteFile( EdtNome.Text );

           T := TTable.Create( Application );
           T.Active    := False;
           T.TableType := ttDBase;
           T.TableName := EdtNome.Text;
           T.FieldDefs.Clear;

           For x := 0 To LstGrupo.Items.Count - 1 Do Begin
               CdsFields.Locate( 'CAMPO', LstGrupo.Items[ x ], [] );
               T.FieldDefs.Add( Copy( LstGrupo.Items[ x ], 1, 8 ) + IntToStr( x ),
                                CdsAux.FieldByName( LstGrupo.Items[ x ] ).DataType,
                                CdsAux.FieldByName( LstGrupo.Items[ x ] ).Size,
                                False );
           End;

           T.CreateTable;
           T.Open;

           While Not CdsAux.Eof Do Begin
                 T.Append;

                 For x := 0 To LstGrupo.Items.Count - 1 Do
                     T.FieldByName( Copy( LstGrupo.Items[ x ], 1, 8 ) + IntToStr( x ) ).Value :=
                         CdsAux.FieldByName( LstGrupo.Items[ x ] ).Value;

                 T.Post;
                 CdsAux.Next;
           End;

           CdsAux.Close;
           T.Close;
        End Else Begin
           AssignFile( Texto, EdtNome.Text );
           Rewrite( Texto );

           WriteLn( Texto, '<HTML>' );
           WriteLn( Texto, '<HEAD>' );
           WriteLn( Texto, '<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=windows-1252">' );
           WriteLn( Texto, '<META NAME="Generator" CONTENT="Gerador de Relatórios - Cm Soluções">' );
           WriteLn( Texto, '<TITLE>' );
           WriteLn( Texto, EdtHeader.Text );
           WriteLn( Texto, '</TITLE>' );
           WriteLn( Texto, '</HEAD>' );
           WriteLn( Texto, '<BODY>' );

           WriteLn( Texto, '<BODY BGCOLOR= "#' + sCorPag + '">' );
           WriteLn( Texto, '<P ALIGN="CENTER">' );

           If Trim( EdtEmpresaHtm.Text ) <> '' Then Begin
              WriteLn( Texto, '<FONT SIZE=6>' );
              WriteLn( Texto, '<FONT COLOR= "#' + sCorCab + '">' );
              WriteLn( Texto, EdtEmpresaHtm.Text );
              WriteLn( Texto, '</FONT>' );
              WriteLn( Texto, '<BR>' );
           End;

           If Trim( EdtMailHtm.Text ) <> '' Then Begin
              WriteLn( Texto, '<A HREF="mailto:' + EdtMailHtm.Text + '"><FONT SIZE=2>' +
                              EdtMailHtm.Text + '</FONT></A>' );
              WriteLn( Texto, '<BR>' );
           End;

           WriteLn( Texto, '</P>' );
           WriteLn( Texto, '<P ALIGN="CENTER">' );
           WriteLn( Texto, '<FONT SIZE=4>' );
           WriteLn( Texto, '<FONT COLOR= "#' + sCorCab + '">' );
           WriteLn( Texto, EdtHeaderHtm.Text );
           WriteLn( Texto, '</P>' );
           WriteLn( Texto, '</FONT>' );

           WriteLn( Texto, '<HR ALIGN="RIGHT" SIZE=1>' );
           WriteLn( Texto, '<FONT SIZE=2>' );
           WriteLn( Texto, '<FONT COLOR= "#' + sCorCorp + '">' );

           WriteLn( Texto, '<P></P>' );
           WriteLn( Texto, '<TABLE>' );
           WriteLn( Texto, '<TR>' );

           For x := 0 To LstGrupo.Items.Count - 1 Do Begin
               WriteLn( Texto, '<TD>' );
               WriteLn( Texto, LstGrupo.Items[ x ] );
               WriteLn( Texto, '</TD>' );
           End;

           WriteLn( Texto, '</TR>' );

           While Not CdsAux.Eof Do Begin
                 WriteLn( Texto, '<TR>' );

                 For x := 0 To LstGrupo.Items.Count - 1 Do Begin
                     CdsFields.Locate( 'CAMPO', LstGrupo.Items[ x ], [] );

                     If CdsFields.FieldByName( 'MASCARA' ).AsString = 'Alinhado a Direita' Then
                        WriteLn( Texto, '<TD ALIGN="RIGHT">' )
                     Else
                        WriteLn( Texto, '<TD>' );

                     WriteLn( Texto, Formatar( LstGrupo.Items[ x ], True ) );
                     WriteLn( Texto, '</TD>' );
                 End;

                 WriteLn( Texto, '</TR>' );
                 CdsAux.Next;
           End;

           WriteLn( Texto, '</TABLE>' );
           WriteLn( Texto, '<P></P>' );
           WriteLn( Texto, '<HR ALIGN="RIGHT" SIZE=1>' );
           WriteLn( Texto, '<P ALIGN="CENTER">' );
           WriteLn( Texto, '<FONT COLOR= "#' + sCorRod + '">' );
           WriteLn( Texto, EdtFooterHtm.Text );
           WriteLn( Texto, '</P>' );
           WriteLn( Texto, '</FONT>' );
           WriteLn( Texto, '</BODY>' );
           WriteLn( Texto, '</HTML>' );

           CloseFile( Texto );
        End;

     If RbVisualiza.Checked Then
        ShellExecuteFile( EdtNome.Text, '', '', SW_SHOW );

     Application.ProcessMessages;
     Close;
  End;
end;

procedure TFrmAssistenteExport.SbRScroll(Sender: TObject;
  ScrollCode: TScrollCode; var ScrollPos: Integer);
begin
  inherited;
  SetasCor;
end;

procedure TFrmAssistenteExport.RgNomeCorClick(Sender: TObject);
Var
  iCor: LongInt;
begin
  inherited;
  iCor := 0;

  Case RgNomeCor.ItemIndex of
       0: iCor := ColorToRgb( sPag.Brush.Color );
       1: iCor := ColorToRgb( sCorp.Brush.Color );
       2: iCor := ColorToRgb( sCab.Brush.Color );
       3: iCor := ColorToRgb( sRod.Brush.Color );
  End;

  sbr.Position := GetrValue( iCor );
  Sbg.Position := GetgValue( iCor );
  sbb.Position := GetbValue( iCor );
  SetasCor;
end;

procedure TFrmAssistenteExport.RemoveWhere;
var
  s: string;
  pos1, pos2: Integer;
begin
  // Ricardo A. SOL: 116922 KTN: 558954

  s := SqlParams.SQL.Text;

  // armazena posição do ORDER BY se existir
  pos2 := Pos( 'ORDER BY', UpperCase( s ) );

  // armazena posição do WHERE
  pos1 := Pos( 'WHERE', UpperCase( s ) );

  if ( pos2 <> 0 ) then
  begin
    FOrderBy := Copy( s, pos2, Length( s ) );
    System.Delete( s, pos2, Length( s ) );
  end
  else
    FOrderBy := '';

  if ( pos1 <> 0 ) then
  begin
    // copia antigo WHERE
    FAntigoWhere := Copy( s, pos1, Length( s ) - pos1 );

    System.Delete( s, pos1, Length( s ) );
  end
  else
    FAntigoWhere := '';

  SqlParams.SQL.Text := s;
end;

procedure TFrmAssistenteExport.RetornaWhere;
var
  s: string;
begin
  // Ricardo A. SOL: 116922 KTN: 558954
  if ( FNovasCondicoes <> '' ) then
    s := 'SELECT * FROM (' + SqlParams.SQL.Text + ' ' + FAntigoWhere + #13+#10 +
      FOrderBy + ') WHERE ' + FNovasCondicoes
  else
    s := SqlParams.SQL.Text + ' ' +#13+#10 + FAntigoWhere + #13+#10 + FOrderBy;

  SqlParams.SQL.Text := s;
end;

end.

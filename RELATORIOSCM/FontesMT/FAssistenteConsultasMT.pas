unit FAssistenteConsultasMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FPAI, IvDictio, IvMulti, IvEMulti, StdCtrls, ComCtrls, ExtCtrls, Mask,
  Buttons, Grids, Wwdbigrd, Wwdbgrid, TreeWzd, Db, DBClient, ImgList,
  uCtrlDdTable, uCtrlDdField;

type
  TFrmAssistenteConsultas = class(TfrmPai)
    TwCons: TTreeWzd;
    BtnAnterior: TBitBtn;
    BtnProximo: TBitBtn;
    BtnCancela: TBitBtn;
    BtnEncerra: TBitBtn;
    Panel2: TPanel;
    NtbAssist: TNotebook;
    LstTabelas: TListBox;
    BtnInclui: TBitBtn;
    BtnExclui: TBitBtn;
    BtnPesquisa: TBitBtn;
    Panel1: TPanel;
    Panel3: TPanel;
    GrdDdTable: TwwDBGrid;
    Panel4: TPanel;
    Panel5: TPanel;
    BtnRemoveCampo: TBitBtn;
    BtnAddcampo: TBitBtn;
    LstCampoSel: TListBox;
    BitBtn1: TBitBtn;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    BtnBuscaCampo: TSpeedButton;
    BtnBuscaCampo1: TSpeedButton;
    BtnAddJoin: TBitBtn;
    BtnRemoveJoin: TBitBtn;
    Panel6: TPanel;
    LstJoins: TListBox;
    CmbOperador: TComboBox;
    RgObriga: TRadioGroup;
    EdtCampo1: TEdit;
    EdtCampo2: TEdit;
    BitBtn2: TBitBtn;
    Panel13: TPanel;
    Label13: TLabel;
    SpeedButton1: TSpeedButton;
    LstCalc: TListView;
    Panel12: TPanel;
    EdtCampoCamlc: TEdit;
    Panel14: TPanel;
    LstCampoCalc: TListBox;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    SpeedButton2: TSpeedButton;
    Panel15: TPanel;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    CmbOperadorCondicao: TComboBox;
    EdtCampoCondicao: TEdit;
    BitBtn8: TBitBtn;
    Panel16: TPanel;
    LstCondicionais: TListBox;
    EdtValoresCondicao: TMaskEdit;
    Panel7: TPanel;
    LstCamposOrdem: TListBox;
    BtnAddOrdem: TBitBtn;
    BtnRemoveOrdem: TBitBtn;
    Panel8: TPanel;
    LstCamposSelOrdem: TListBox;
    LstCompChek: TLabel;
    CkbGrupo: TCheckBox;
    LstGrupo: TListBox;
    Panel9: TPanel;
    BtnDow: TBitBtn;
    BtnUp: TBitBtn;
    Bevel1: TBevel;
    Image1: TImage;
    CkbDistinct: TCheckBox;
    PnlFinal: TPanel;
    PageFinal: TPageControl;
    TbsGrava: TTabSheet;
    MenDescSql: TMemo;
    Panel10: TPanel;
    Label12: TLabel;
    EdtNomeCons: TEdit;
    Panel11: TPanel;
    TbsSql: TTabSheet;
    MemSql: TMemo;
    PnlCampos: TPanel;
    LstCampoTab: TListBox;
    LstCampoTabSel: TListBox;
    CmbTabelas: TComboBox;
    ImageList1: TImageList;
    CdsTabela: TClientDataSet;
    CdsCampo: TClientDataSet;
    DsTabela: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnProximoClick(Sender: TObject);
    procedure BtnAnteriorClick(Sender: TObject);
    procedure BtnEncerraClick(Sender: TObject);
    procedure BtnCancelaClick(Sender: TObject);
    procedure GrdDdTableKeyPress(Sender: TObject; var Key: Char);
    procedure BtnIncluiClick(Sender: TObject);
    procedure BtnExcluiClick(Sender: TObject);
    procedure NtbAssistPageChanged(Sender: TObject);
    procedure BtnAddcampoClick(Sender: TObject);
    procedure BtnRemoveCampoClick(Sender: TObject);
    procedure BtnAddJoinClick(Sender: TObject);
    procedure BtnRemoveJoinClick(Sender: TObject);
    procedure CkbGrupoClick(Sender: TObject);
    procedure BtnAddOrdemClick(Sender: TObject);
    procedure BtnRemoveOrdemClick(Sender: TObject);
    procedure BtnUpClick(Sender: TObject);
    procedure LstCampoTabDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure CmbTabelasChange(Sender: TObject);
    procedure BtnBuscaCampoClick(Sender: TObject);
    procedure BtnPesquisaClick(Sender: TObject);
    procedure CkbDistinctClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure LstCampoTabSelClick(Sender: TObject);
    procedure EdtValoresCondicaoKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton2Click(Sender: TObject);
    procedure LstCampoTabSelDblClick(Sender: TObject);
  private
    { Private declarations }
    sPalavra, sTipoDado, sTipoDado1, sTipoDado2: String;
    bMudouTabelas, bMudouCampos: Boolean;
    LstIdTabelas, LstAliaseSelecionados, LstTabelasSelecionadas,
    LstTipoChave, LstTipoDado: Tstrings;
    EdtPnlCampo: TEdit;
    Function  SetAliasTabela( sTabela, sAliasTabela: String ): String;
    procedure MoveItems( LstSource, LStDest: TListBox );
    procedure ExcluiItems( LstSource: TListBox );
    procedure MostraPnlCampos( iTop, iLeft: Integer; Edt: TEdit );
    function  VerificaTipoDeDado( sMsg: String ): Boolean;
    function  FormataCondicional( sTexto, sFormato: String ): String;
  public
    { Public declarations }
    DdTable: TCtrlDdTable;
    DdField: TCtrlDdField;
  end;

var
  FrmAssistenteConsultas: TFrmAssistenteConsultas;

implementation

Uses uMensErro, dBasedados, uSistema, uMidasUtil, FAguardeDDic, FDataDicMT;

{$R *.DFM}

Function TFrmAssistenteConsultas.SetAliasTabela( sTabela, sAliasTabela: String ): String;
Var
  iLetra: Integer;
  sIniTabela, sAlias: String;
begin
  iLetra     := 1;
  sIniTabela := Copy( sTabela, 1, 1 );
  sAlias     := sIniTabela + Chr( 64 + iLetra );

  While LstAliaseSelecionados.IndexOf( sAlias ) >= 0 Do Begin
        inc( iLetra );
        sAlias := sIniTabela + Chr( 64 + iLetra );
  End;

  LstIdTabelas.Add( CdsTabela.FieldByName( 'IDDDTABLE' ).AsString );
  LstAliaseSelecionados.Add( sAlias );
  LstTabelasSelecionadas.Add( sTabela + ' ' + sAlias );
  Result := sAliasTabela + ' ' + sAlias;
end;

procedure TFrmAssistenteConsultas.MoveItems( LstSource, LStDest: TListBox );
Var
   x: Integer;
begin
   If ( LstSource.ItemIndex = -1 ) Or ( LstSource.SelCount = 0 ) Then
      Exit;

   For x := 0 To LstSource.Items.Count - 1 Do
       If LstSource.Selected[ x ] Then
          LstDest.Items.Add( LstSource.Items[ x ] );
end;

procedure TFrmAssistenteConsultas.ExcluiItems( LstSource: TListBox );
begin
  If LstSource.ItemIndex > -1 Then
     LstSource.Items.Delete( LstSource.ItemIndex );
end;

procedure TFrmAssistenteConsultas.MostraPnlCampos( iTop, iLeft: Integer; Edt: TEdit );
begin
  CmbTabelas.Text := '';
  PnlCampos.Tag   := 0;
  PnlCampos.Top   := iTop;
  PnlCampos.Left  := iLeft;
  EdtPnlCampo     := Edt;

  If PnlCampos.Visible Then Begin
     If LstCampoTabSel.Visible Then Begin
        If LstCampoTabSel.ItemIndex <> -1 Then
           Edt.Text := LstCampoTabSel.Items[ LstCampoTabSel.ItemIndex ];
     End Else Begin
        If LstCampoTab.ItemIndex <> -1 Then
           Edt.Text := LstCampoTab.Items[ LstCampoTab.ItemIndex ];
     End;
  End;
  
  PnlCampos.Visible := Not PnlCampos.Visible;
end;

function TFrmAssistenteConsultas.VerificaTipoDeDado( sMsg: String ): Boolean;
begin
  If STipoDado1 <> sTipoDado2 Then Begin
     Application.MessageBox( PChar( sMsg ), 'Atenção', Mb_IconInformation );
     Result := False;
  End Else
     Result := True;
End;

function TFrmAssistenteConsultas.FormataCondicional( sTexto, sFormato: String ): String;
Begin
  If Copy( sFormato, 1, 1 ) = 'C' Then
     Result := QuotedStr( sTexto )
  Else
     If Copy( sFormato, 1, 1 ) = 'N' Then
        Result := 'TO_NUMBER(' + QuotedStr( sTexto  ) + ')'
     Else
        If Copy( sFormato, 1, 1 ) = 'D' Then
           Result := 'TO_DATE(' + QuotedStr( sTexto ) + ',''DD/MM/YYYY'')'
        Else
           Result := QuotedStr( sTexto );
End;

procedure TFrmAssistenteConsultas.FormCreate(Sender: TObject);
begin
  inherited;
  LstTabelasSelecionadas := TStringList.Create;
  LstAliaseSelecionados  := TStringList.Create;
  LstIdTabelas           := TStringList.Create;
  LstTipoChave           := TStringList.Create;
  LstTipoDado            := TStringList.Create;

  bMudouTabelas := False;
  bMudouCampos  := False;

  LstCamposSelOrdem.Items.Clear;
  LstCondicionais.Items.Clear;
  LstCamposOrdem.Items.Clear;
  LstCampoCalc.Items.Clear;
  LstCampoSel.Items.Clear;
  LstTabelas.Items.Clear;
  LstJoins.Items.Clear;
  LstGrupo.Items.Clear;

  NtbAssist.PageIndex := 0;
  BtnProximo.Click;

  sPalavra := '';
  TwCons.Etapa.Pos := 1;
  NtbAssist.PageIndex := 0;

  DdTable := TCtrlDdTable.Create();
  DdTable.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                      Sistema.ConnectionSide, Sistema.AppRemoteServer, True );
  DdField := TCtrlDdField.Create();
  DdField.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                      Sistema.ConnectionSide, Sistema.AppRemoteServer, True );

  CdsTabela.Data := DdTable.ListaDdTable( 0 );
  CdsCampo.Data  := DdField.ListaDdField( -1 );
end;

procedure TFrmAssistenteConsultas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  LstAliaseSelecionados.Free;
  LstTabelasSelecionadas.Free;
  LstIdTabelas.Free;
  LstTipoChave.Free;
  LstTipoDado.Free;

  If CdsTabela.Active Then
     CdsTabela.Close;

  If CdsCampo.Active Then
     CdsCampo.Close;

  DdTable.Free;
  DdField.Free;
end;

procedure TFrmAssistenteConsultas.BtnProximoClick(Sender: TObject);
begin
  inherited;
  TwCons.Etapa.Avancar;
  NtbAssist.PageIndex := TwCons.Etapa.Pos - 1;
end;

procedure TFrmAssistenteConsultas.BtnAnteriorClick(Sender: TObject);
begin
  inherited;
  TwCons.Etapa.Retornar;
  NtbAssist.PageIndex := TwCons.Etapa.Pos - 1;
end;

procedure TFrmAssistenteConsultas.BtnEncerraClick(Sender: TObject);
begin
  inherited;
  If ( ( PageFinal.Visible ) Or ( EdtNomeCons.Parent = PnlFinal ) ) And ( EdtNomeCons.Text = '' ) Then
     Application.MessageBox( 'Não foi Informado o Nome da Consulta', 'Atenção', Mb_IconInformation )
  Else
     If MemSql.Lines.Count = 0 Then
        Application.MessageBox( 'A Consulta Não foi Finalizada', 'Atenção', Mb_IconInformation )
     Else Begin
        Close;
        ModalResult := MrOk;
     End;
end;

procedure TFrmAssistenteConsultas.BtnCancelaClick(Sender: TObject);
begin
  inherited;
  MemSql.Clear;
  MenDescSql.Clear;
  EdtNomeCons.Text := '';
end;

procedure TFrmAssistenteConsultas.GrdDdTableKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  Case Key Of
       'A'..'Z', 'a'..'z': Begin
           sPalavra := sPalavra + Key;
           CdsTabela.Locate( 'TABLENAME', sPalavra, [ LoPartialKey, LoCaseInsensitive ] );
       End;

       Else sPalavra := ''
  End;
end;

procedure TFrmAssistenteConsultas.BtnIncluiClick(Sender: TObject);
begin
  inherited;
  GrdDDTable.SetFocus;
  LstTabelas.Items.Add( SetAliasTabela( CdsTabela.FieldByName( 'TABLENAME' ).AsString,
                                        CdsTabela.FieldByName( 'TABLEALIAS' ).AsString ) );
  sPalavra := '';
  bMudouTabelas := True;
end;

procedure TFrmAssistenteConsultas.BtnExcluiClick(Sender: TObject);
begin
  inherited;
  LstTabelas.SetFocus;

  If LstTabelas.ItemIndex <> -1 Then Begin
     LstIdTabelas.Delete( LstTabelas.ItemIndex );
     LstAliaseSelecionados.Delete( LstTabelas.ItemIndex );
     LstTabelas.Items.Delete( LstTabelas.ItemIndex );
     bMudouTabelas := True;
  End;

  sPalavra := '';
end;

procedure TFrmAssistenteConsultas.NtbAssistPageChanged(Sender: TObject);
Var
  x, iAux: Integer;
begin
  inherited;
  If ( LstTabelas.Items.Count = 0 ) And ( NtbAssist.PageIndex In [ 1, 6 ] ) Then Begin
     NtbAssist.PageIndex := 0;
     TwCons.Etapa.Pos := 1;
     Exit;
  End;

  Case NtbAssist.PageIndex of
       1: Begin
          PnlCampos.Top   := 42;
          PnlCampos.Left  := 47;
          PnlCampos.Tag   := 1;
          CmbTabelas.Text := '';
          CmbTabelas.OnChange( Self );
          PnlCampos.Visible := True;

          If bMudouTabelas Then Begin
             CmbTabelas.Items := LstTabelas.Items;
             LstCampoTabSel.Visible := False;

             LstCampoSel.Items.Clear;
             LstCampoTab.Items.Clear;
             LstCampoCalc.Items.Clear;

             LstTipoChave.Clear;
             LstTipoDado.Clear;

             For x := 0 To LstIdTabelas.Count - 1 Do Begin
                 CdsCampo.Data := DdField.ListaDdField( 0, StrToInt( LstIdTabelas[ x ] ) );

                 While Not CdsCampo.Eof Do Begin
                       LstCampoTab.Items.Add( LstAliaseSelecionados[ x ] + '.' +
                                              CdsCampo.FieldByName( 'FIELDALIAS' ).AsString );
                       LstTipoChave.Add( CdsCampo.FieldByName( 'TIPOCHAVE' ).AsString );
                       LstTipoDado.Add( CdsCampo.FieldByName( 'TIPODEDADO' ).AsString );
                       CdsCampo.Next;
                 End;

                 CdsCampo.Close;
               End;

               bMudouTabelas := False;
               bMudouCampos  := True;
          End;
       End;

       2, 0, 3, 4, 5: Begin
          If bMudouCampos Then Begin
             LstJoins.Items.Clear;
             LstCamposOrdem.Items := LstCampoSel.Items;
             LstCamposSelOrdem.Items.Clear;
             LstGrupo.Items := LstCampoSel.Items;
             bMudouCampos   := False;
          End;

          PnlCampos.Visible := False;

          If NtbAssist.PageIndex = 2 Then Begin
             CmbTabelas.Text := '';
             CmbTabelas.OnChange( Self );
          End;
       End;

       7: Begin
          MemSql.Lines.Clear;

          If CkbDistinct.Checked Then
             MemSql.Lines.Add( 'SELECT DISTINCT' )
          Else
             MemSql.Lines.Add( 'SELECT' );

          // Adiciona Campos
          iAux := LstCampoSel.Items.Count - 1;

          For x := 0 To iAux Do
              If ( x = iAux ) And ( LstCampoCalc.Items.Count = 0 ) Then
                 MemSql.Lines.Add( '   ' + LstCampoSel.Items[ x ] )
              Else
                 MemSql.Lines.Add( '   ' + LstCampoSel.Items[ x ] + ',' );

          // Adiciona Campos Calculados
          iAux := LstCampoCalc.Items.Count - 1;

          For x := 0 To iAux Do
              If x = iAux Then
                 MemSql.Lines.Add( '   ' + LstCampoCalc.Items[ x ] )
              Else
                 MemSql.Lines.Add( '   ' + LstCampoCalc.Items[ x ] + ',' );

          // Adiciona Alises e Tabelas
          MemSql.Lines.Add( 'FROM' );
          iAux := LstTabelasSelecionadas.Count - 1;

          For x := 0 To iAux Do
              If x = iAux Then
                 MemSql.Lines.Add( '   ' + LstTabelasSelecionadas[ x ] )
              Else
                 MemSql.Lines.Add( '   ' + LstTabelasSelecionadas[ x ] + ',' );

          //Adiciona Condicionais Caso Existam
          iAux := LstCondicionais.Items.Count - 1;

          If iAux > -1 Then Begin
             MemSql.Lines.Add( 'WHERE' );

             For x := 0 To iAux Do
                 If ( x = iAux ) And ( LstJoins.Items.Count = 0 ) Then
                    MemSql.Lines.Add( '   ' + LstCondicionais.Items[ x ])
                 Else
                    MemSql.Lines.Add( '   ' + LstCondicionais.Items[ x ] + ' AND ' );
          End;

          // Adiciona Joins Caso Existam
          iAux := LstJoins.Items.Count - 1;

          If iAux > -1 Then Begin
             If MemSql.Lines.IndexOf( 'WHERE' ) = -1 Then
                MemSql.Lines.Add( 'WHERE' );

             For x := 0 To iAux Do
                 If x = iAux Then
                    MemSql.Lines.Add( '   ' + LstJoins.Items[ x ] )
                 Else
                    MemSql.Lines.Add( '   ' + LstJoins.Items[ x ] + ' AND ' );
          End;

          // Se selecionado, adiciona o grupo

          If CkbGrupo.Checked Then Begin
             MemSql.Lines.Add( 'GROUP BY' );
             iAux := LstGrupo.Items.Count - 1;

             For x := 0 To iAux Do
                 If x = iAux Then
                    MemSql.Lines.Add( '   ' + LstGrupo.Items[ x ] )
                 Else
                    MemSql.Lines.Add( '   ' + LstGrupo.Items[ x ] + ',' );
          End;

          //Adiciona a ordenação
          iAux := LstCamposSelOrdem.Items.Count - 1;

          If iAux > -1 Then Begin
             MemSql.Lines.Add( 'ORDER BY' );

             For x := 0 To iAux Do
                 If x = iAux Then
                    MemSql.Lines.Add( '   ' + LstCamposSelOrdem.Items[ x ] )
                 Else
                    MemSql.Lines.Add( '   ' + LstCamposSelOrdem.Items[ x ] + ',' );
          End;
       End;
  End;
  
  BtnAnterior.Enabled := ( NtbAssist.PageIndex <> 0 );
  BtnProximo.Enabled  := ( NtbAssist.PageIndex <> 7 );
end;

procedure TFrmAssistenteConsultas.BtnAddcampoClick(Sender: TObject);
begin
  inherited;
  If LstCampoTabSel.Visible Then
     MoveItems( LstCampoTabSel, LstCampoSel )
  Else
     MoveItems( LstCampoTab, LstCampoSel );

  bMudouCampos := True;
end;

procedure TFrmAssistenteConsultas.BtnRemoveCampoClick(Sender: TObject);
begin
  inherited;
  ExcluiItems( LstCampoSel );
  bMudouCampos := True;
end;

procedure TFrmAssistenteConsultas.BtnAddJoinClick(Sender: TObject);
Var
   sObriga1, sObriga2: String;
   sOperador: Array[ 0..6 ] of String;
begin
  inherited;
  If Not VerificaTipoDeDado( 'Os Campos são de tipos diferentes, impossível efetuar o relacionamento' ) Then
     Exit;

  If ( EdtCampo1.Text = '' ) Or ( EdtCampo2.Text = '' ) Or ( CmbOperador.Text = '' ) Then Begin
     MsgDlg( 'Você deve informar os campos e o operador do relacionamento',
             'Campo Faltando', MtInformation, [Mbok],  0 );
     Exit;
  End;

  sOperador[0] := ' = ';
  sOperador[1] := ' <> ';
  sOperador[2] := ' > ';
  sOperador[3] := ' < ';
  sOperador[4] := ' >= ';
  sOperador[5] := ' <= ';

  Case RgObriga.ItemIndex Of
       0: Begin
          sObriga1 := '';
          sObriga2 := '';
       End;

       1: Begin
          sObriga1 := '';
          sObriga2 := ' (+)';
       End;

       2: Begin
          sObriga1 := ' (+)';
          sObriga2 := '';
       End;
  End;

  LstJoins.Items.Add( EdtCampo1.Text + sObriga1 + sOperador[ CmbOperador.ItemIndex ] +
                      EdtCampo2.Text + sObriga2 );
end;

procedure TFrmAssistenteConsultas.BtnRemoveJoinClick(Sender: TObject);
begin
  inherited;
  ExcluiItems( LstJoins );
end;

procedure TFrmAssistenteConsultas.CkbGrupoClick(Sender: TObject);
begin
  inherited;
  LstGrupo.Enabled := CkbGrupo.Checked;
end;

procedure TFrmAssistenteConsultas.BtnAddOrdemClick(Sender: TObject);
begin
  inherited;
  MoveItems( LstCamposOrdem, LstCamposSelOrdem );
end;

procedure TFrmAssistenteConsultas.BtnRemoveOrdemClick(Sender: TObject);
begin
  inherited;
  ExcluiItems( LstCamposSelOrdem );
end;

procedure TFrmAssistenteConsultas.BtnUpClick(Sender: TObject);
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

  If ( Sender as TBitBtn ).Tag = 1 Then
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

procedure TFrmAssistenteConsultas.LstCampoTabDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
Var
  iTipoChaveIni: Integer;
  sTexto, sTipoChave: String;
begin
  inherited;
  With ( Control As TListBox ) Do Begin
       iTipoChaveIni := Control.Tag;
       sTexto        := Items[ Index ];
       sTipoChave    := LstTipoChave[ Index + iTipoChaveIni ];
       Canvas.FillRect( Rect );

       If StipoChave = 'P' Then
          Canvas.Font.Color := ClGreen
        Else
           If StipoChave = 'R' Then
              Canvas.Font.Color := ClRed
           Else
              Canvas.Font.Color := clGray;

       Canvas.TextOut( Rect.Left, Rect.Top, sTexto );
  End;
end;

procedure TFrmAssistenteConsultas.CmbTabelasChange(Sender: TObject);
Var
  x: Integer;
  sAlias: String;
begin
  inherited;
  LstCampoTabSel.Tag := -1;
  LstCampoTabSel.Items.Clear;

  If CmbTabelas.Text <> '' Then Begin
     sAlias := Copy( Trim( CmbTabelas.Text ), Length( Trim( CmbTabelas.Text ) ) - 1, 2 );

     For x := 0 To LstCampoTab.Items.Count - 1 Do Begin
         If Copy( LstCampoTab.Items[ x ], 1, 2 ) = sAlias Then Begin
            If LstCampoTabSel.Tag = -1 Then
               LstCampoTabSel.Tag := X;

            LstCampoTabSel.Items.Add( LstCampoTab.Items[ x ] );
         End;
     End;

     LstCampoTabSel.Visible := True;
  End ELse
     LstCampoTabSel.Visible := False;
end;

procedure TFrmAssistenteConsultas.BtnBuscaCampoClick(Sender: TObject);
begin
  inherited;
  Case ( Sender As TSpeedButton ).Tag of
       0: Begin
          MostraPnlCampos( 78, 50, EdtCampo1 );
          sTipoDado1 := sTipoDado;
       End;

       1: Begin
          MostraPnlCampos( 166, 50, EdtCampo2 );
          sTipoDado2 := sTipoDado;
       End;
  End;
end;

procedure TFrmAssistenteConsultas.BtnPesquisaClick(Sender: TObject);
begin
  inherited;
  FrmDataDic.ShowModal;
end;

procedure TFrmAssistenteConsultas.CkbDistinctClick(Sender: TObject);
begin
  inherited;
  If MemSql.Lines.Count <> 0 Then Begin
     MemSql.Lines.Delete( 0 );

     If CkbDistinct.Checked Then
        MemSql.Lines.Insert( 0, 'SELECT DISTINCT' )
     Else
        MemSql.Lines.Insert( 0, 'SELECT' );
  End;
end;

procedure TFrmAssistenteConsultas.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  MostraPnlCampos( 127, 49, EdtCampoCamlc );
end;

procedure TFrmAssistenteConsultas.BitBtn4Click(Sender: TObject);
begin
  inherited;
  ExcluiItems( LstCampoCalc );
end;

procedure TFrmAssistenteConsultas.BitBtn3Click(Sender: TObject);
Var
  sCalc: String;
begin
  inherited;

  If ( LstCalc.SelCount <> 0 ) And ( EdtCampoCamlc.Text <> '' ) Then Begin
     If ( LstCalc.Selected.Index In [ 0, 2 ] ) And ( Copy( sTipoDado, 1, 1 ) <> 'N' ) Then Begin
        Application.MessageBox( 'Esta Fórmula se aplica apenas a campos numéricos', 'Atenção', Mb_IconInformation );
        Exit;
     End;

     Case LstCalc.Selected.Index Of
          0: sCalc := 'SUM ( ' + EdtCampoCamlc.Text + ' )';
          1: sCalc := 'COUNT ( ' + EdtCampoCamlc.Text + ' )';
          2: sCalc := 'AVG ( ' + EdtCampoCamlc.Text + ' )';
          3: sCalc := 'MAX ( ' + EdtCampoCamlc.Text + ' )';
          4: sCalc := 'MIN ( ' + EdtCampoCamlc.Text + ' )';
     End;

     sCalc := sCalc + ' AS CALC_' + IntToStr( LstCampoCalc.Items.Count );
     LstCampoCalc.Items.Add( sCalc );
  End;
end;

procedure TFrmAssistenteConsultas.BitBtn7Click(Sender: TObject);
begin
  inherited;
  ExcluiItems( LstCondicionais );
end;

procedure TFrmAssistenteConsultas.BitBtn6Click(Sender: TObject);
Var
   sOperador: Array[ 0..6 ] of String;
begin
  inherited;
  sOperador[0] := ' = ';
  sOperador[1] := ' <> ';
  sOperador[2] := ' > ';
  sOperador[3] := ' < ';
  sOperador[4] := ' >= ';
  sOperador[5] := ' <= ';
  sOperador[6] := ' Like ';

  If ( EdtCampoCondicao.Text = '' ) Or ( CmbOperadorCondicao.Text = '' ) Or
         ( EdtValoresCondicao.Text = '' ) Then
     Exit;

  LstCondicionais.Items.Add( EdtCampoCondicao.Text + ' ' +
                             sOperador[ CmbOperadorCondicao.ItemIndex ] + ' ' +
                             FormataCondicional( EdtValoresCondicao.Text, sTipoDado ) );
end;

procedure TFrmAssistenteConsultas.LstCampoTabSelClick(Sender: TObject);
begin
  inherited;
  If ( Sender as TListBox ).SelCount = 1 Then
     sTipoDado :=  LstTipoDado[ ( Sender as TListBox ).ItemIndex + ( Sender as TListBox ).Tag ];
end;

procedure TFrmAssistenteConsultas.EdtValoresCondicaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  If Copy( sTipoDado, 1, 1 ) = 'N' Then Begin
     Case Key Of
          '0'..'9', ',', #8: Key := Key;
          '.': Key := ','
          Else Key := #0;
      End;
  End;
end;

procedure TFrmAssistenteConsultas.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  MostraPnlCampos( 79, 49, EdtCampoCondicao );

  If Copy( sTipoDado, 1, 1 ) = 'D' Then
     EdtValoresCondicao.EditMask := '!99/99/0000;1'
  Else
     EdtValoresCondicao.EditMask := '';
end;

procedure TFrmAssistenteConsultas.LstCampoTabSelDblClick(
  Sender: TObject);
begin
  inherited;
  If PnlCampos.Tag = 0 Then Begin
     EdtPnlCampo.Text  := LstCampoTabSel.Items[ LstCampoTabSel.ItemIndex ];
     PnlCampos.Visible := False;
  End Else
     If PnlCampos.Tag = 1 Then
        BtnAddcampoClick( Self );
end;

end.

{
  DF 06/07 Gustavo
  Correão do erro "Field TIPOCHAVE is not of expected type":
  Consultas de acesso ao ddfield > Campo "tipochave" foi mudado o tipo
  Fim DF 06/07 Gustavo
}
unit Asistente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, Grids, DBGrids, ComCtrls, Mask,
  Wwdatsrc, Wwquery, Wwdbigrd, Wwdbgrid, Db, DBTables, TreeWzd, ImgList;

type
  TFrmAssistente = class(TForm)
    Panel2: TPanel;
    NtbAssist: TNotebook;
    LstTabelas: TListBox;
    BtnInclui: TBitBtn;
    BtnExclui: TBitBtn;
    BtnPesquisa: TBitBtn;
    Panel1: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    BtnRemoveCampo: TBitBtn;
    BtnAddcampo: TBitBtn;
    LstCampoSel: TListBox;
    BtnAddJoin: TBitBtn;
    BtnRemoveJoin: TBitBtn;
    Panel6: TPanel;
    LstJoins: TListBox;
    CmbOperador: TComboBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    RgObriga: TRadioGroup;
    Panel7: TPanel;
    LstCamposOrdem: TListBox;
    BtnAddOrdem: TBitBtn;
    BtnRemoveOrdem: TBitBtn;
    Panel8: TPanel;
    LstCamposSelOrdem: TListBox;
    LstGrupo: TListBox;
    Panel9: TPanel;
    BtnDow: TBitBtn;
    BtnUp: TBitBtn;
    CkbGrupo: TCheckBox;
    LstCompChek: TLabel;
    BitBtn1: TBitBtn;
    EdtCampo1: TEdit;
    EdtCampo2: TEdit;
    BtnBuscaCampo: TSpeedButton;
    BtnBuscaCampo1: TSpeedButton;
    BitBtn2: TBitBtn;
    PnlCampos: TPanel;
    LstCampoTab: TListBox;
    LstCampoTabSel: TListBox;
    CmbTabelas: TComboBox;
    CkbDistinct: TCheckBox;
    Bevel1: TBevel;
    PnlFinal: TPanel;
    PageFinal: TPageControl;
    TbsGrava: TTabSheet;
    MenDescSql: TMemo;
    TbsSql: TTabSheet;
    MemSql: TMemo;
    Panel10: TPanel;
    Label12: TLabel;
    Panel11: TPanel;
    EdtNomeCons: TEdit;
    Image1: TImage;
    ImageList1: TImageList;
    LstCalc: TListView;
    Panel12: TPanel;
    Label13: TLabel;
    EdtCampoCamlc: TEdit;
    SpeedButton1: TSpeedButton;
    Panel13: TPanel;
    Panel14: TPanel;
    LstCampoCalc: TListBox;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Panel15: TPanel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    SpeedButton2: TSpeedButton;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    CmbOperadorCondicao: TComboBox;
    EdtCampoCondicao: TEdit;
    BitBtn8: TBitBtn;
    Panel16: TPanel;
    LstCondicionais: TListBox;
    EdtValoresCondicao: TMaskEdit;
    QryDdTable: TwwQuery;
    QryDdField: TwwQuery;
    DsDdTable: TwwDataSource;
    GrdDdTable: TwwDBGrid;
    QryDdTableIDDDTABLE: TFloatField;
    QryDdTableTABLENAME: TStringField;
    QryDdTableTABLEALIAS: TStringField;
    TwCons: TTreeWzd;
    BtnAnterior: TBitBtn;
    BtnProximo: TBitBtn;
    BtnCancela: TBitBtn;
    BtnEncerra: TBitBtn;
    procedure BtnProximoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GrdDDTableKeyPress(Sender: TObject; var Key: Char);
    procedure BtnIncluiClick(Sender: TObject);
    procedure BtnExcluiClick(Sender: TObject);
    procedure NtbAssistPageChanged(Sender: TObject);
    procedure BtnAddcampoClick(Sender: TObject);
    procedure BtnRemoveCampoClick(Sender: TObject);
    procedure BtnRemoveJoinClick(Sender: TObject);
    procedure BtnAddJoinClick(Sender: TObject);
    procedure CkbGrupoClick(Sender: TObject);
    procedure BtnRemoveOrdemClick(Sender: TObject);
    procedure BtnAddOrdemClick(Sender: TObject);
    procedure BtnUpClick(Sender: TObject);
    procedure LstCampoTabDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure CmbTabelasChange(Sender: TObject);
    procedure BtnBuscaCampoClick(Sender: TObject);
    procedure BtnPesquisaClick(Sender: TObject);
    procedure CkbDistinctClick(Sender: TObject);
    procedure BtnEncerraClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BtnCancelaClick(Sender: TObject);
    procedure LstCampoTabSelClick(Sender: TObject);
    procedure EdtValoresCondicaoKeyPress(Sender: TObject; var Key: Char);
    procedure BtnAnteriorClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    sPalavra, sTipoDado, sTipoDado1, sTipoDado2: String;
    bMudouTabelas, bMudouCampos: Boolean;
    LstIdTabelas, LstAliaseSelecionados, LstTabelasSelecionadas,
    LstTipoChave, LstTipoDado: Tstrings;
    Function  SetAliasTabela(sTabela, sAliasTabela: String):String;
    procedure MoveItems(LstSource,LStDest: TListBox);
    procedure ExcluiItems(LstSource: TListBox);
    procedure MostraPnlCampos(iTop,iLeft:Integer;Edt:TEdit);
    function VerificaTipoDeDado(sMsg:String):Boolean;
    function FormataCondicional(sTexto,sFormato:String):String;
  public
    { Public declarations }
  end;

var
  FrmAssistente: TFrmAssistente;

implementation

uses FDataDic, FDataDicMT, CmSqlWzd;

{$R *.DFM}


procedure TFrmAssistente.BtnProximoClick(Sender: TObject);
begin
  TwCons.Etapa.Avancar;
  NtbAssist.PageIndex := TwCons.Etapa.Pos - 1;
end;

procedure TFrmAssistente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  LstAliaseSelecionados.Free
  ;
  LstTabelasSelecionadas.Free;
  LstIdTabelas.Free;
  LstTipoChave.Free;
  LstTipoDado.Free;

  If QryDdTable.Active Then QryDdTable.Close;

  If QryDdField.Active Then QryDdField.Close;
  If QryDdField.Prepared Then QryDdField.UnPrepare;
end;

procedure TFrmAssistente.GrdDDTableKeyPress(Sender: TObject;
  var Key: Char);
begin
  Case Key Of
  'A'..'Z','a'..'z':
  Begin
    sPalavra := sPalavra + Key;
    QryDdTable.Locate('TABLENAME',sPalavra,[LoPartialKey,LoCaseInsensitive]);
  End;
  Else
    sPalavra := ''
  End;
end;

procedure TFrmAssistente.BtnIncluiClick(Sender: TObject);
begin
   GrdDDTable.SetFocus;
   LstTabelas.Items.Add(SetAliasTabela(QryDdTable.FieldByName('TABLENAME').AsString,QryDdTable.FieldByName('TABLEALIAS').AsString));
   sPalavra := '';
   bMudouTabelas := True;
end;

procedure TFrmAssistente.BtnExcluiClick(Sender: TObject);
begin
  LstTabelas.SetFocus;
  If LstTabelas.ItemIndex <> -1 Then
  Begin
     LstIdTabelas.Delete(LstTabelas.ItemIndex);
     LstAliaseSelecionados.Delete(LstTabelas.ItemIndex);
     LstTabelas.Items.Delete(LstTabelas.ItemIndex);
     bMudouTabelas := True;
  End;
  sPalavra := '';
end;

Function TFrmAssistente.SetAliasTabela(sTabela, sAliasTabela: String):String;
Var iLetra:Integer;
    sIniTabela, sAlias: String;
begin
    iLetra     := 1;
    sIniTabela := Copy(sTabela,1,1);
    sAlias     := sIniTabela + Chr(64+iLetra);
    While LstAliaseSelecionados.IndexOf(sAlias) >= 0 Do
    Begin
          inc(iLetra);
          sAlias := sIniTabela + Chr(64+iLetra);
    End;
    LstIdTabelas.Add(QryDdTable.FieldByName('IDDDTABLE').AsString);
    LstAliaseSelecionados.Add(sAlias);
    LstTabelasSelecionadas.Add(sTabela + ' ' + sAlias);
    Result := sAliasTabela + ' ' + sAlias;
end;


procedure TFrmAssistente.NtbAssistPageChanged(Sender: TObject);
Var
   x, iAux:Integer;
begin

   If (LstTabelas.Items.Count = 0) And (NtbAssist.PageIndex In [1,6]) Then
   Begin
       NtbAssist.PageIndex := 0;
       TwCons.Etapa.Pos := 1;
       Exit;
   End;

   Case NtbAssist.PageIndex of
   1:
   Begin
        PnlCampos.Top     := 42;
        PnlCampos.Left     := 47;
        CmbTabelas.Text   := '';
        CmbTabelas.OnChange(Self);
        PnlCampos.Visible := True;

        If bMudouTabelas Then
        Begin
             CmbTabelas.Items := LstTabelas.Items;
             LstCampoTabSel.Visible := False;

             LstCampoSel.Items.Clear;
             LstCampoTab.Items.Clear;
             LstCampoCalc.Items.Clear;

             LstTipoChave.Clear;
             LstTipoDado.Clear;

             For X:=0 To LstIdTabelas.Count - 1 Do
             Begin
                  If QryDdField.Active Then QryDdField.Close;
                  QryDdField.Params[0].AsInteger := StrToInt(LstIdTabelas[X]);
                  QryDdField.Open;
                  QryDdField.First;
                  While Not QryDdField.Eof Do
                  Begin
                       LstCampoTab.Items.Add(LstAliaseSelecionados[X] + '.' + QryDdField.FieldByName('FIELDALIAS').AsString);
                       LstTipoChave.Add(QryDdField.FieldByName('TIPOCHAVE').AsString);
                       LstTipoDado.Add(QryDdField.FieldByName('TIPODEDADO').AsString);
                       QryDdField.Next;
                  End;
                  QryDdField.Close;
             End;
             bMudouTabelas := False;
             bMudouCampos := True;
        End;
   End;
   2,0,3,4,5:
   Begin
       If bMudouCampos Then
       Begin
          LstJoins.Items.Clear;

          LstCamposOrdem.Items := LstCampoSel.Items;
          LstCamposSelOrdem.Items.Clear;

          LstGrupo.Items := LstCampoSel.Items;
          bMudouCampos := False;
       End;

       PnlCampos.Visible := False;

       If NtbAssist.PageIndex = 2 Then
       Begin
            CmbTabelas.Text   := '';
            CmbTabelas.OnChange(Self);
       End;
   End;
   7://Monta Querye
   Begin
      MemSql.Lines.Clear;

      If CkbDistinct.Checked Then
         MemSql.Lines.Add('SELECT DISTINCT')
      Else
         MemSql.Lines.Add('SELECT');

      //Adiciona Campos
      iAux := LstCampoSel.Items.Count - 1;
      For X:=0 To iAux Do
          If (X = iAux) And (LstCampoCalc.Items.Count = 0) Then
             MemSql.Lines.Add('   ' + LstCampoSel.Items[X])
          Else
             MemSql.Lines.Add('   ' + LstCampoSel.Items[X] + ',');

      //Adiciona Campos Calculados
      iAux := LstCampoCalc.Items.Count - 1;
      For X:=0 To iAux Do
          If X = iAux Then
             MemSql.Lines.Add('   ' + LstCampoCalc.Items[X])
          Else
             MemSql.Lines.Add('   ' + LstCampoCalc.Items[X] + ',');

      //Adiciona Alises e Tabelas
      MemSql.Lines.Add('FROM');
      iAux := LstTabelasSelecionadas.Count - 1;
      For X:=0 To iAux Do
          If X = iAux Then
             MemSql.Lines.Add('   ' + LstTabelasSelecionadas[x])
          Else
             MemSql.Lines.Add('   ' + LstTabelasSelecionadas[x] + ',');

      //Adiciona Condicionais Caso Existam
      iAux := LstCondicionais.Items.Count - 1;
      If iAux > -1 Then
      Begin
           MemSql.Lines.Add('WHERE');
           For X:=0 To iAux Do
               If (X = iAux) And (LstJoins.Items.Count = 0) Then
                  MemSql.Lines.Add('   ' + LstCondicionais.Items[X])
               Else
                  MemSql.Lines.Add('   ' + LstCondicionais.Items[X] + ' AND ');
      End;

      //Adiciona Joins Caso Existam
      iAux := LstJoins.Items.Count - 1;
      If iAux > -1 Then
      Begin
           If (MemSql.Lines.IndexOf('WHERE') = -1) Then
              (MemSql.Lines.Add('WHERE'));
           For X:=0 To iAux Do
               If X = iAux Then
                  MemSql.Lines.Add('   ' + LstJoins.Items[X])
               Else
                  MemSql.Lines.Add('   ' + LstJoins.Items[X] + ' AND ');
      End;

      //Se selecionado, adiciona o grupo
      If CkbGrupo.Checked Then
      Begin
      MemSql.Lines.Add('GROUP BY');
      iAux := LstGrupo.Items.Count - 1;
      For X:=0 To iAux Do
          If X = iAux Then
             MemSql.Lines.Add('   ' + LstGrupo.Items[X])
          Else
             MemSql.Lines.Add('   ' + LstGrupo.Items[X] + ',');
      End;

      //Adiciona a ordenação
      iAux := LstCamposSelOrdem.Items.Count - 1;
      If iAux > -1 Then
      Begin
           MemSql.Lines.Add('ORDER BY');
           For X:=0 To iAux Do
               If X = iAux Then
                  MemSql.Lines.Add('   ' + LstCamposSelOrdem.Items[X])
               Else
                  MemSql.Lines.Add('   ' + LstCamposSelOrdem.Items[X] + ',');
      End;

   End;
   End;
end;

procedure TFrmAssistente.MoveItems(LstSource,LStDest: TListBox);
Var
   X: Integer;
begin
   If (LstSource.ItemIndex = -1) Or (LstSource.SelCount = 0) Then Exit;
   For X:=0 To LstSource.Items.Count - 1 Do
       If LstSource.Selected[X] Then LstDest.Items.Add(LstSource.Items[x]);
end;

procedure TFrmAssistente.ExcluiItems(LstSource: TListBox);
begin
   If (LstSource.ItemIndex > -1) Then
      LstSource.Items.Delete(LstSource.ItemIndex);
end;


procedure TFrmAssistente.BtnAddcampoClick(Sender: TObject);
begin
  If LstCampoTabSel.Visible Then
     MoveItems(LstCampoTabSel,LstCampoSel)
  Else
     MoveItems(LstCampoTab,LstCampoSel);
  bMudouCampos := True;
end;

procedure TFrmAssistente.BtnRemoveCampoClick(Sender: TObject);
begin
  ExcluiItems(LstCampoSel);
  bMudouCampos := True;
end;

procedure TFrmAssistente.BtnRemoveJoinClick(Sender: TObject);
begin
  ExcluiItems(LstJoins);
end;

procedure TFrmAssistente.BtnAddJoinClick(Sender: TObject);
Var sObriga1,sObriga2: String;
    sOperador: Array [0..6] of String;
begin

  If Not VerificaTipoDeDado('Os Campos são de tipos diferentes, impossível efetuar o relacionamento') Then Exit;

  sOperador[0] := ' = ';
  sOperador[1] := ' <> ';
  sOperador[2] := ' > ';
  sOperador[3] := ' < ';
  sOperador[4] := ' >= ';
  sOperador[5] := ' <= ';

  If (EdtCampo1.Text = '') Or
     (EdtCampo2.Text = '') Or
     (CmbOperador.Text = '') Then Exit;

  Case RgObriga.ItemIndex Of
  0:
  Begin
    sObriga1 := '';
    sObriga2 := '';
  End;
  1:
  Begin
    sObriga1 := '';
    sObriga2 := ' (+)';
  End;
  2:
  Begin
    sObriga1 := ' (+)';
    sObriga2 := '';
  End;
  End;

  LstJoins.Items.Add(EdtCampo1.Text +
                     sObriga1 +
                     sOperador[CmbOperador.ItemIndex] +
                     EdtCampo2.Text +
                     sObriga2);
end;



procedure TFrmAssistente.CkbGrupoClick(Sender: TObject);
begin
   LstGrupo.Enabled := CkbGrupo.Checked;
end;

procedure TFrmAssistente.BtnRemoveOrdemClick(Sender: TObject);
begin
  ExcluiItems(LstCamposSelOrdem);
end;

procedure TFrmAssistente.BtnAddOrdemClick(Sender: TObject);
begin
  MoveItems(LstCamposOrdem,LstCamposSelOrdem);
end;

procedure TFrmAssistente.BtnUpClick(Sender: TObject);
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

procedure TFrmAssistente.LstCampoTabDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
Var sTexto, sTipoChave: String;
    iTipoChaveIni: Integer;
begin
  With (Control As TListBox) Do
  Begin
       iTipoChaveIni := Control.Tag;

       sTexto := Items[Index];
       sTipoChave := LstTipoChave[Index + iTipoChaveIni];

       Canvas.FillRect(Rect);
       If StipoChave = 'P' Then
          Canvas.Font.Color := ClGreen
        Else
           if StipoChave = 'R' Then
              Canvas.Font.Color := ClRed
           Else
              Canvas.Font.Color := clGray;
       Canvas.TextOut(Rect.Left,Rect.Top,sTexto);
  End;
end;

procedure TFrmAssistente.CmbTabelasChange(Sender: TObject);
Var
   X: Integer;
   sAlias: String;
begin
   LstCampoTabSel.Tag := -1;
   LstCampoTabSel.Items.Clear;
   If CmbTabelas.Text <> '' Then
   Begin
      sAlias := Copy(Trim(CmbTabelas.Text),Length(Trim(CmbTabelas.Text))-1,2);
      For X:=0 To LstCampoTab.Items.Count - 1 Do
      Begin
        If Copy(LstCampoTab.Items[x],1,2) = sAlias Then
        Begin
           If LstCampoTabSel.Tag = -1 Then LstCampoTabSel.Tag := X;
           LstCampoTabSel.Items.Add(LstCampoTab.Items[X]);
        End;
      End;
      LstCampoTabSel.Visible := True;
   End
   ELse
      LstCampoTabSel.Visible := False;
end;

procedure TFrmAssistente.BtnBuscaCampoClick(Sender: TObject);
begin
  Case (Sender As TSpeedButton).Tag of
       0:
       Begin
         MostraPnlCampos(78,50,EdtCampo1);
         sTipoDado1 := sTipoDado;
       End;
       1:
       Begin
         MostraPnlCampos(166,50,EdtCampo2);
         sTipoDado2 := sTipoDado;
       End;
  End;
end;

procedure TFrmAssistente.BtnPesquisaClick(Sender: TObject);
begin
  FrmDataDicMT.ShowModal;
end;

procedure TFrmAssistente.CkbDistinctClick(Sender: TObject);
begin
 If (MemSql.Lines.Count <> 0) Then
  Begin
       MemSql.Lines.Delete(0);
       If CkbDistinct.Checked Then
          MemSql.Lines.Insert(0,'SELECT DISTINCT')
       Else
          MemSql.Lines.Insert(0,'SELECT');       
  End;
end;

procedure TFrmAssistente.BtnEncerraClick(Sender: TObject);
begin
   If ((PageFinal.Visible) Or (EdtNomeCons.Parent = PnlFinal)) And (EdtNomeCons.Text = '') Then
      Application.MessageBox('Não Foi Informado o Nome da Consulta','Atenção',Mb_IconInformation)
   Else
      If (MemSql.Lines.Count = 0) Then
         Application.MessageBox('A Consulta Não Foi Finalizada','Atenção',Mb_IconInformation)
      Else
      Begin
         Close;
         ModalResult := MrOk;
      End;
end;

procedure TFrmAssistente.SpeedButton1Click(Sender: TObject);
begin
   MostraPnlCampos(127,49,EdtCampoCamlc);
end;

procedure TFrmAssistente.BitBtn4Click(Sender: TObject);
begin
   ExcluiItems(LstCampoCalc);
end;

procedure TFrmAssistente.BitBtn3Click(Sender: TObject);
Var
  sCalc: String;
begin
  If (LstCalc.SelCount <> 0) And (EdtCampoCamlc.Text <> '') Then
  Begin

      If (LstCalc.Selected.Index in [0,2]) And (Copy(sTipoDado,1,1) <> 'N') Then
      Begin
         Application.MessageBox('Esta Fórmula se aplica apenas a campos numéricos','Atenção',Mb_IconInformation);
         Exit;
      End;

      Case LstCalc.Selected.Index Of
           0: sCalc := 'SUM ( ' + EdtCampoCamlc.Text + ' )';
           1: sCalc := 'COUNT ( ' + EdtCampoCamlc.Text + ' )';
           2: sCalc := 'AVG ( ' + EdtCampoCamlc.Text + ' )';
           3: sCalc := 'MAX ( ' + EdtCampoCamlc.Text + ' )';
           4: sCalc := 'MIN ( ' + EdtCampoCamlc.Text + ' )';
      End;
      sCalc := sCalc  + ' AS CALC_' + IntToStr(LstCampoCalc.Items.Count);
      LstCampoCalc.Items.Add(sCalc);
  End;
end;

procedure TFrmAssistente.SpeedButton2Click(Sender: TObject);
begin
    MostraPnlCampos(79,49,EdtCampoCondicao);
    If (Copy(sTipoDado,1,1) = 'D') Then
        EdtValoresCondicao.EditMask := '!99/99/0000;1'
    Else
        EdtValoresCondicao.EditMask := '';
end;

procedure TFrmAssistente.MostraPnlCampos(iTop,iLeft:Integer;Edt:TEdit);
begin
    CmbTabelas.Text   := '';

    PnlCampos.Top     := iTop;
    PnlCampos.Left    := iLeft;
    If PnlCampos.Visible Then
    Begin
         If LstCampoTabSel.Visible Then
         Begin
            If LstCampoTabSel.ItemIndex <> -1 Then
               Edt.Text := LstCampoTabSel.Items[LstCampoTabSel.ItemIndex];
         End
         Else
         Begin
            If LstCampoTab.ItemIndex <> -1 Then
               Edt.Text := LstCampoTab.Items[LstCampoTab.ItemIndex];
         End;
    End;
    PnlCampos.Visible := Not PnlCampos.Visible;
end;

procedure TFrmAssistente.BitBtn7Click(Sender: TObject);
begin
   ExcluiItems(LstCondicionais);
end;

procedure TFrmAssistente.BitBtn6Click(Sender: TObject);
Var
   sOperador: Array [0..6] of String;
begin

  sOperador[0] := ' = ';
  sOperador[1] := ' <> ';
  sOperador[2] := ' > ';
  sOperador[3] := ' < ';
  sOperador[4] := ' >= ';
  sOperador[5] := ' <= ';
  sOperador[6] := ' Like ';

  If (EdtCampoCondicao.Text = '') Or
     (CmbOperadorCondicao.Text = '') Or
     (EdtValoresCondicao.Text = '') Then Exit;

  LstCondicionais.Items.Add(EdtCampoCondicao.Text + ' ' +
                            sOperador[CmbOperadorCondicao.ItemIndex] + ' ' +
                            FormataCondicional(EdtValoresCondicao.Text,sTipoDado));
end;

procedure TFrmAssistente.BtnCancelaClick(Sender: TObject);
begin
   FrmAssistente.MemSql.Clear;
   FrmAssistente.MenDescSql.Clear;
   FrmAssistente.EdtNomeCons.Text := '';
end;

procedure TFrmAssistente.LstCampoTabSelClick(Sender: TObject);
begin
  If (Sender as TListBox).SelCount = 1 Then
     sTipoDado :=  LstTipoDado[(Sender as TListBox).ItemIndex + (Sender as TListBox).Tag];
end;

function TFrmAssistente.VerificaTipoDeDado(sMsg:String):Boolean;
begin
  If STipoDado1 <> sTipoDado2 Then
  Begin
     Application.MessageBox(PChar(sMsg),'Atenção',Mb_IconInformation);
     Result := False;
  End
  Else
     Result := True;
End;

function TFrmAssistente.FormataCondicional(sTexto,sFormato:String):String;
Begin
 If (Copy(sFormato,1,1)= 'C') Then
    Result := '''' + sTexto + ''''
    Else
    If (Copy(sFormato,1,1) = 'N') Then
       Result := 'TO_NUMBER(''' + sTexto + ''')'
    Else
    If (Copy(sFormato,1,1) = 'D') Then
       Result := 'TO_DATE(''' + sTexto  + ''',''DD/MM/YYYY'')'
    Else
       Result := '''' + sTexto + '''';
End;

procedure TFrmAssistente.EdtValoresCondicaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  If (Copy(sTipoDado,1,1) = 'N') Then
  Begin
      Case Key Of
        '0'..'9',',',#8: Key := Key;
        '.': Key := ','
      Else
        Key := #0;
      End;

  End;
end;

procedure TFrmAssistente.BtnAnteriorClick(Sender: TObject);
begin
  TwCons.Etapa.Retornar;
  NtbAssist.PageIndex := TwCons.Etapa.Pos - 1;
end;

procedure TFrmAssistente.FormCreate(Sender: TObject);
begin
  TwCons.Etapa.Pos := 1;
  NtbAssist.PageIndex := 0;

  LstAliaseSelecionados  := TStringList.Create;
  LstTabelasSelecionadas := TStringList.Create;
  LstIdTabelas           := TStringList.Create;
  LstTipoChave           := TStringList.Create;
  LstTipoDado            := TStringList.Create;

  bMudouTabelas          := False;
  bMudouCampos           := False;

  LstTabelas.Items.Clear;
  LstCampoSel.Items.Clear;
  LstJoins.Items.Clear;
  LstCamposSelOrdem.Items.Clear;
  LstCamposOrdem.Items.Clear;
  LstGrupo.Items.Clear;
  LstCampoCalc.Items.Clear;
  LstCondicionais.Items.Clear;

  NtbAssist.PageIndex := 0;
  BtnProximo.Click;

  sPalavra := '';

  If Not QryDdTable.Active Then QryDdTable.Open;
  QryDdTable.First;
  If Not QryDdField.Prepared Then QryDdField.Prepare;
end;

end.


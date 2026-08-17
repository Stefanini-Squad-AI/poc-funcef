unit fFiltraSqlRelat;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, Mask, uMensErro,
  TREdit, UDataBase, Grids, DBGrids, wwdbdatetimepicker, CMDateTimePicker;

Type
  TFrResult = (FrError, FrFull, FrFiltrado);

Type
  TFrmFiltraSqlRelat = class(TfrmOkCancelar)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    BtnInclui: TBitBtn;
    BtnExclui: TBitBtn;
    RgJuncoes: TRadioGroup;
    RgParentesis: TRadioGroup;
    EdtValoresCondicao: TMaskEdit;
    Cmbcampos: TComboBox;
    CmbComparadores: TComboBox;
    CkbCaixa: TCheckBox;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Panel2: TPanel;
    Panel3: TPanel;
    LstCondicoes: TListBox;
    Panel4: TPanel;
    BtnUp: TBitBtn;
    BtnDow: TBitBtn;
    EdtDate: TCMDateTimePicker;
    EdtNum: TRealEdit;
    QryAux: TwwQuery;
    procedure BtnExcluiClick(Sender: TObject);
    procedure BtnUpClick(Sender: TObject);
    procedure BtnIncluiClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CmbcamposChange(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    bOracle81 :Boolean;
    sCampos :String;
    sNomeView, sSqlOrigem  :String;    
    Function BuscaTipoDado(iIndiceCampo: Integer):String;
    Function CorrigeDecimaSeparator(sNum,sTipo:String):String;
  public
    { Public declarations }
    QryOrigem: TQuery;
    iIdReports, iOrigemCM :Integer;
  end;

var
  FrmFiltraSqlRelat: TFrmFiltraSqlRelat;

implementation

{$R *.DFM}

Function TFrmFiltraSqlRelat.BuscaTipoDado(iIndiceCampo: Integer):String;
Begin
 If iIndiceCampo > -1 Then
 Begin
    If Not QryOrigem.Active Then
    Begin
      If bOracle81 Then
        QryOrigem.Sql.Text := 'SELECT ' + sCampos + ' FROM ' + sNomeView + ' WHERE 1=2';

      QryOrigem.Open;
    End;

    Case QryOrigem.Fields[Cmbcampos.ItemIndex].DataType of
      ftString: Result := 'S';
      ftBytes, ftSmallint, ftInteger, ftWord: Result := 'I';
      ftFloat, ftCurrency: Result := 'N';
      ftBoolean: Result := 'B';
      ftDate, ftDateTime: Result := 'D';
      ftTime: Result := 'T';
      ftBlob, ftMemo,ftGraphic,ftFmtMemo: Result := 'BL';
    End;
 End
 Else
    Result := '';
End;

procedure TFrmFiltraSqlRelat.BtnExcluiClick(Sender: TObject);
begin
  inherited;
  If LstCondicoes.ItemIndex > -1 Then
     LstCondicoes.Items.Delete(LstCondicoes.ItemIndex);
end;

procedure TFrmFiltraSqlRelat.BtnUpClick(Sender: TObject);
Var
   iMax, iMin, iIndiceLista, iProximo: Integer;
   sAnterior: String;
begin
   inherited;
   iMax := LstCondicoes.Items.Count - 1;
   iMin := 0;
   iIndiceLista := LstCondicoes.ItemIndex;
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

   sAnterior                        := LstCondicoes.Items[iIndiceLista];
   LstCondicoes.Items[iIndiceLista] := LstCondicoes.Items[iProximo];
   LstCondicoes.Items[iProximo]     := sAnterior;
   LstCondicoes.SetFocus;
   LstCondicoes.ItemIndex := iProximo;
end;

procedure TFrmFiltraSqlRelat.BtnIncluiClick(Sender: TObject);
Var
  sAux, sFrase, sJuncao, sCompara, sValor: String;
begin
  inherited;
  If (Cmbcampos.ItemIndex > -1) And
     (CmbComparadores.ItemIndex > -1) Then
     Begin
       Case CmbComparadores.ItemIndex of
            0: sCompara := ' = ';
            1: sCompara := ' <> ';
            2: sCompara := ' < ';
            3: sCompara := ' <= ';
            4: sCompara := ' > ';
            5: sCompara := ' >= ';
            6:
            Begin
              If bOracle81 Then
                 sCompara := ' LIKE '
              Else
                 sCompara := ' = ';
            End;
            7:
            Begin
              If bOracle81 Then
                 sCompara := ' LIKE '
              Else
                 sCompara := ' = ';
            End;
       End;

       Case RgJuncoes.ItemIndex of
            0: sJuncao := ' AND ';
            1: sJuncao := ' OR ';
       End;

       sFrase := '';

       sAux := BuscaTipoDado(Cmbcampos.ItemIndex);

       If bOracle81 Then
       Begin
          Case sAux[1] of
          'S','B':
            Begin
                Case CmbComparadores.ItemIndex Of
                  6: sValor := EdtValoresCondicao.Text + '%';
                  7: sValor := '%' + EdtValoresCondicao.Text + '%';
                  Else
                     sValor := EdtValoresCondicao.Text;
                End;

                If CkbCaixa.Checked Then
                   sFrase := '(' + QryOrigem.Fields[Cmbcampos.ItemIndex].FieldName +
                             sCompara + '''' + sValor + ''')'
                Else
                   sFrase := '(UPPER(' + QryOrigem.Fields[Cmbcampos.ItemIndex].FieldName + ')' +
                             sCompara + 'UPPER(''' + sValor + '''))'

            End;
          'N','I':  sFrase := '(' + QryOrigem.Fields[Cmbcampos.ItemIndex].FieldName +
                              sCompara + CorrigeDecimaSeparator(EdtNum.Text,sAux[1]) + ')';
          'D': sFrase := '(' + QryOrigem.Fields[Cmbcampos.ItemIndex].FieldName +
                         sCompara + 'TO_DATE(''' + EdtDate.Text  + ''',''DD/MM/YYYY''))';
          'T': sFrase := '(' + QryOrigem.Fields[Cmbcampos.ItemIndex].FieldName +
                         sCompara + 'TO_DATE(''' + EdtValoresCondicao.Text  + ''',''HH/MI''))';
          End;
       End
       Else
       Begin
          Case sAux[1] of
          'S','B':
            Begin
                Case CmbComparadores.ItemIndex Of
                  6: sValor := EdtValoresCondicao.Text + '*';
                  7: sValor := EdtValoresCondicao.Text + '*';
                  Else
                     sValor := EdtValoresCondicao.Text;
                End;

                sFrase := '(' + QryOrigem.Fields[Cmbcampos.ItemIndex].FieldName +
                          sCompara + '''' + sValor + ''')'

            End;
          'N','I':  sFrase := '(' + QryOrigem.Fields[Cmbcampos.ItemIndex].FieldName +
                              sCompara + CorrigeDecimaSeparator(EdtNum.Text,sAux[1]) + ')';
          'D': sFrase := '(' + QryOrigem.Fields[Cmbcampos.ItemIndex].FieldName +
                         sCompara + '''' + EdtDate.Text  + ''')';
          'T': sFrase := '(' + QryOrigem.Fields[Cmbcampos.ItemIndex].FieldName +
                         sCompara + '''' + EdtValoresCondicao.Text  + ''')';
          End;
       End;

       If sFrase <> '' Then
       Begin
         Case RgParentesis.ItemIndex of
            1: sFrase := '(' + sFrase;
            2: sFrase := sFrase + ')';
         End;

         If LstCondicoes.Items.Count > 0 Then
            sFrase := sJuncao + sFrase;

         LstCondicoes.Items.Add(sFrase);

         RgJuncoes.ItemIndex := 0;
         RgParentesis.ItemIndex := 0;
         EdtValoresCondicao.Text := '';
       End;
     End;
end;

procedure TFrmFiltraSqlRelat.FormShow(Sender: TObject);
Var
  X:Integer;
begin
  inherited;
  If QryOrigem.Active Then QryOrigem.Close;
  QryOrigem.GetFieldNames(Cmbcampos.Items);
  sCampos := '';
  For X:=0 To Cmbcampos.Items.Count - 1 Do
      If sCampos = '' Then
         sCampos := Cmbcampos.Items[x]
      Else
         sCampos := sCampos + ', ' + Cmbcampos.Items[x];

  sSqlOrigem := QryOrigem.Sql.Text;
  if not sistema.UsuarioUnico then
     sNomeView := 'CM.VWCMTMP' + IntToStr(iOrigemCM) + IntToStr(iIdReports)
  else
     sNomeView := Sistema.Owner + '.VWCMTMP' + IntToStr(iOrigemCM) + IntToStr(iIdReports)

  bOracle81 := False;

  If Not bOracle81 Then
  Begin
     QryOrigem.Filtered := False;
     QryOrigem.Filter := '';
     QryOrigem.FilterOptions := QryOrigem.FilterOptions - [foCaseInsensitive, foNoPartialCompare];
     CmbComparadores.Items.Delete(7);
  End;
end;

procedure TFrmFiltraSqlRelat.bbtnConfirmarClick(Sender: TObject);
Var
  sCondicoes: String;
  X: Integer;
begin
  inherited;

  sCondicoes := '';
  If QryOrigem.Active Then QryOrigem.Close;

  If LstCondicoes.Items.Count > 0 Then
  Begin
    For X:=0 To LstCondicoes.Items.Count - 1 Do
        sCondicoes := sCondicoes + ' ' + LstCondicoes.Items[X];

    If sCondicoes <> '' Then
    Begin
       If bOracle81 Then
          QryOrigem.Sql.Text := 'SELECT ' + sCampos + ' FROM ' + sNomeView + ' WHERE ' + sCondicoes
       Else
       Begin
          If Not CkbCaixa.Checked Then
             QryOrigem.FilterOptions := QryOrigem.FilterOptions + [foCaseInsensitive];

          QryOrigem.Filter := sCondicoes;
          QryOrigem.Filtered := True;
       End;
    End
    Else
      QryOrigem.Sql.Text := sSqlOrigem;

    Try
      QryOrigem.Open;
    Except
      On E :Exception Do
      Begin
        MsgDlg('Filtro Incorreto' + (#13+#10) + E.Message,'Atenção',MtInformation,[MbOk],0);
        ModalResult := MrAbort;
      End;
    End;
  End;
end;

procedure TFrmFiltraSqlRelat.FormCreate(Sender: TObject);
begin
  inherited;
  CmbComparadores.ItemIndex := 0;
end;

procedure TFrmFiltraSqlRelat.CmbcamposChange(Sender: TObject);
Var
  sAux: String;
begin
  inherited;

  sAux := BuscaTipoDado(Cmbcampos.ItemIndex);

  CmbComparadores.Items.Clear;
  CmbComparadores.Items.Add('Igual a');
  CmbComparadores.Items.Add('Diferente de');
  CmbComparadores.Items.Add('Menor Que');
  CmbComparadores.Items.Add('Menor Ou Igual a');
  CmbComparadores.Items.Add('Maior Que');
  CmbComparadores.Items.Add('Maoir Ou Igual a');

  If sAux <> ''  Then
  Begin
    EdtNum.Visible :=  ((sAux = 'N') OR (sAux = 'I'));
    EdtDate.Visible := (sAux = 'D');
    EdtValoresCondicao.Visible := ((sAux = 'S') OR (sAux = 'B') OR (sAux = 'BL'));

    Case sAux[1] of
      'T': EdtValoresCondicao.EditMask := '!90:00;1; ';
      'N':
         Begin
           EdtNum.DecDigits := 2;
           EdtNum.NumberFormat := fNumber;
         End;
      'I':
         Begin
           EdtNum.DecDigits := 0;
           EdtNum.NumberFormat := iNumber;
         End;
      'S','B':
         Begin
           CmbComparadores.Items.Add('Começando Com');

           If bOracle81 Then
              CmbComparadores.Items.Add('Possui o Texto');
         End;
      Else
        EdtValoresCondicao.EditMask := '';
     End;
  End;
  CmbComparadores.ItemIndex := 0;
end;

Function TFrmFiltraSqlRelat.CorrigeDecimaSeparator(sNum,sTipo:String):String;
Var
   sAuxNum, sMilseparador, sDecSeparador: String;
Begin
   If sTipo = 'I' Then
      Result := sNum
   Else
   Begin
      sAuxNum := Trim(sNum);
      sDecSeparador := Copy(sNum,Length(sNum)-2,1);

      If sDecSeparador = '.' Then
         sMilseparador := ','
      Else
         sMilseparador := '.';

      While Pos(sMilseparador,sAuxNum) <> 0 Do
            Delete(sAuxNum,Pos(sMilseparador,sAuxNum),1);

      sAuxNum[Length(Trim(sAuxNum))-2] := '.';

      Result := sAuxNum;
   End;
End;

procedure TFrmFiltraSqlRelat.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  LstCondicoes.Clear;
end;

End.


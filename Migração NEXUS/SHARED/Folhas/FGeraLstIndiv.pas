//***************************************************************************************
//Rotina: <FGeraLstIndiv.pas>
//Nº SOL: <256994>
//Nº PPM: <850266>
//Data da Alteração:      <25/06/2015>
//Alteração Form:  <Inserção de Order By na qryLstIndiv>
//Responsável: <Marcelo Cardoso>
//Descrição:  <Ordenar por nome de usuário os registros apresentados na tela gera lista
//              individual para processamento das previa geral.>
{
--------------------------------------------------------------------------------

              TELA DE SELEÇÃO PARA
              GERAR LISTA INDIVIDUAL (FGeraLstIndiv.pas)

              SOL             :  249100
              Kintana         :  736486
              Módulo          :  Folha
              Autor           :  Helio Lima Custodio
              Data de Término :  14/04/2015

--------------------------------------------------------------------------------
-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FGeraLstIndiv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, CheckLst, wwStoreP, DBaseDados,
  uVerificaPreenchimento, UMensErro, USistema, Spin, Grids, Wwdbigrd,
  Wwdbgrid, Wwdatsrc;

type
  TFrmGeraLstIndiv = class(TfrmOkCancelar)
    qryLstIndiv: TwwQuery;
    qryLstIndivIDUSUARIO: TFloatField;
    qryLstIndivNOMEUSUARIO: TStringField;
    lblQtSel: TLabel;
    grpMesRef: TGroupBox;
    cmbMes: TComboBox;
    spnedAno: TSpinEdit;
    dbgrdLstIndiv: TwwDBGrid;
    dsLstIndiv: TwwDataSource;
    qryLstIndivSELECIONAR: TFloatField;
    updLstIndiv: TUpdateSQL;
    btnMarcaTodas: TBitBtn;
    btnInverte: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dbgrdLstIndivCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure btnInverteClick(Sender: TObject);
    procedure btnMarcaTodasClick(Sender: TObject);
    procedure dbgrdLstIndivFieldChanged(Sender: TObject; Field: TField);
  private
    LstIdIndiv : TStringList;
    vMesProcessamento : String;
    qtSel : Integer;

    procedure CarregaListaIndiv;
    procedure AtualizaSelecionados;
    procedure AtualizaUsuario(idsSelecionados : String);
    procedure SetMesProcessamento(Value : String);
    procedure AumentaQuantidadeSel;
    procedure DiminiuQuantidadeSel;
    procedure AtualizaQtSelecionados(quantidadeSel : Integer);
    function VerificaPreenchimento:Boolean;
    procedure InverteSelecao;
    procedure SelecionaTodos;
    function ObtemMesProcessamento : String;
  public
    property MesProcessamento : String read vMesProcessamento write SetMesProcessamento;
  end;

var
  FrmGeraLstIndiv: TFrmGeraLstIndiv;

implementation

uses FGeraLstIndivResul;
{$R *.DFM}

procedure TFrmGeraLstIndiv.FormShow(Sender: TObject);
var
    AYear, AMonth, ADay: Word;
begin
  inherited;
  
  DecodeDate(date, AYear, AMonth, ADay);
  cmbMes.ItemIndex := AMonth - 1;
  cmbMes.Text := cmbMes.Items[cmbMes.ItemIndex];
  spnedAno.Text := IntToStr(AYear);

  qtSel := 0;

  LstIdIndiv := TStringList.Create;
  CarregaListaIndiv;
end;

procedure TFrmGeraLstIndiv.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryLstIndiv.Close;
  FreeAndNil(LstIdIndiv);
end;

procedure TFrmGeraLstIndiv.CarregaListaIndiv;
begin
      qryLstIndiv.Open;
      qryLstIndiv.Edit;
end;

procedure TFrmGeraLstIndiv.bbtnCancelarClick(Sender: TObject);
begin
   inherited;

   qryLstIndiv.First;
   while not qryLstIndiv.Eof do
   begin
       qryLstIndiv.Edit;
       qryLstIndivSELECIONAR.AsInteger := 0;
       qryLstIndiv.Next;
   end;

   AtualizaQtSelecionados(0);

   qryLstIndiv.First;
   qryLstIndiv.Edit;
end;

procedure TFrmGeraLstIndiv.bbtnConfirmarClick(Sender: TObject);
var
    resDlg,
    i : Integer;
    idsSelecionados : String;
begin
  inherited;

  resDlg := MsgDlg('Confirma a geração de ' + IntToStr(qtSel) + ' Listas Individuais? Onde ' +
                  IntToStr(qtSel) +
                  ' representa a quantidade de listas as serem criadas.',
                  'Confirmação',
                  mtConfirmation,
                  [mbYes, mbNo],
                  0);

  if resDlg <> mrYes then
     Exit;

  if VerificaPreenchimento then
  begin
     AtualizaSelecionados;
     FrmGeraLstIndivResul := TFrmGeraLstIndivResul.Create(Self.Owner);
     FrmGeraLstIndivResul.Mes := ObtemMesProcessamento;

     qryLstIndiv.First;
     while not qryLstIndiv.Eof do
     begin
           if qryLstIndivSELECIONAR.AsInteger = 1 then
                FrmGeraLstIndivResul.LstIdsSel.Add(qryLstIndivIDUSUARIO.AsString);

           qryLstIndiv.Next;
     end;

     Visible := False;
     FrmGeraLstIndivResul.ShowModal;
     FreeAndNil(FrmGeraLstIndivResul);
     Close;

  end;

end;

procedure TFrmGeraLstIndiv.AtualizaSelecionados;
var
    lstTemp : TStringList;
    idsSelecionados : String;
begin

  lstTemp := TStringList.Create;

  qryLstIndiv.First;
  while not qryLstIndiv.Eof do
  begin
        if qryLstIndivSELECIONAR.AsInteger = 1 then
            lstTemp.Add(qryLstIndivIDUSUARIO.AsString);

        qryLstIndiv.Next;
  end;

  idsSelecionados := StringReplace(Trim(lstTemp.Text),#13#10,',', [rfReplaceAll]);
  AtualizaUsuario(idsSelecionados);
end;

function TFrmGeraLstIndiv.VerificaPreenchimento:Boolean;
var
    qtSel : Integer;
begin

  Result := False;

  qtSel := 0;
  qryLstIndiv.First;
  while not qryLstIndiv.Eof do
  begin
        if qryLstIndivSELECIONAR.AsInteger = 1 then
             Inc(qtSel);
       qryLstIndiv.Next;
  end;

  try
    if qtSel < 1 then
      raise EValidacao.CreateVal('Nenhum registro foi selecionado.', dbgrdLstIndiv);

   except
      on ev : EValidacao do
      begin
         Screen.Cursor := crDefault;
         if ev.Show then MsgDlg(ev.message, Sistema.NomeModulo, mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;
   end;

   Result := True;

end;

procedure TFrmGeraLstIndiv.AtualizaUsuario(idsSelecionados : String);
var
     wwStoredProc : TwwStoredProc;
begin

     wwStoredProc := TwwStoredProc.Create( nil );
     vMesProcessamento := ObtemMesProcessamento;
     
     try
	 wwStoredProc.DatabaseName   :=  dtmBaseDados.dbBaseDados.DataBaseName;
	 wwStoredProc.StoredProcName := 'CM.SP_FB_GERALISTAPREVIA';
	 wwStoredProc.Params.CreateParam( ftString,  'MESPROCESSAMENTO' , ptInput).AsString  := vMesProcessamento;
	 wwStoredProc.Params.CreateParam( ftString,  'LISTAUSR'         , ptInput).AsString  := idsSelecionados;

	 wwStoredProc.Prepare;
	 wwStoredProc.ExecProc;

         MessageDlg('Listas Individuais geradas com sucesso.', mtInformation, [mbOK], 0);
     Except
	 wwStoredProc.Free;
     end;

     
     wwStoredProc.Free;
end;

function TFrmGeraLstIndiv.ObtemMesProcessamento : String;
var
    sAnoAux,
    sMesAux : String;
begin
   sAnoAux := spnedAno.Text;
   If cmbMes.ItemIndex <= 8 Then
      sMesAux := '0' + IntToStr(cmbMes.ItemIndex + 1)
   Else
      Begin
         If cmbMes.ItemIndex <> 12 Then
            sMesAux := IntToStr(cmbMes.ItemIndex + 1)
         Else
            sMesAux := '12';
      End;
   Result := sAnoAux + '/' + sMesAux;
end;

procedure TFrmGeraLstIndiv.SetMesProcessamento(Value : String);
begin
       vMesProcessamento := Value;
end;

procedure TFrmGeraLstIndiv.dbgrdLstIndivCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
   If Field = qryLstIndivSELECIONAR Then
      Abrush.color := $00BDF9F8
end;

procedure TFrmGeraLstIndiv.InverteSelecao;
begin
  qryLstIndiv.First;
  while not qryLstIndiv.Eof do
  begin
        qryLstIndiv.Edit;
        if qryLstIndivSELECIONAR.AsInteger = 0 then
           qryLstIndivSELECIONAR.AsInteger := 1
        else
             qryLstIndivSELECIONAR.AsInteger := 0;

        qryLstIndiv.Next;
  end;

  qryLstIndiv.First;
  qryLstIndiv.Edit;

end;

procedure TFrmGeraLstIndiv.SelecionaTodos;
begin
  qryLstIndiv.First;
  while not qryLstIndiv.Eof do
  begin
        qryLstIndiv.Edit;
        if qryLstIndivSELECIONAR.AsInteger <> 1 then
           qryLstIndivSELECIONAR.AsInteger := 1;
        qryLstIndiv.Next;
  end;

  qryLstIndiv.First;
  qryLstIndiv.Edit;
end;

procedure TFrmGeraLstIndiv.btnInverteClick(Sender: TObject);
begin
  inherited;
  InverteSelecao;
end;

procedure TFrmGeraLstIndiv.btnMarcaTodasClick(Sender: TObject);
begin
  inherited;
  SelecionaTodos;
end;

procedure TFrmGeraLstIndiv.AumentaQuantidadeSel;
begin
      Inc(qtSel);
      AtualizaQtSelecionados(qtSel);
end;

procedure TFrmGeraLstIndiv.DiminiuQuantidadeSel;
begin
      qtSel := qtSel - 1;
      AtualizaQtSelecionados(qtSel);
end;

procedure TFrmGeraLstIndiv.AtualizaQtSelecionados(quantidadeSel : Integer);
begin
        qtSel := quantidadeSel;

        lblQtSel.Caption := 'Selecionados: ' + IntToStr(qtSel);
end;


procedure TFrmGeraLstIndiv.dbgrdLstIndivFieldChanged(Sender: TObject;
  Field: TField);
begin
  inherited;
  if Field = qryLstIndivSELECIONAR then
  begin
        if qryLstIndivSELECIONAR.AsInteger = 1 then
             AumentaQuantidadeSel
        else
             DiminiuQuantidadeSel;
  end;
end;

end.

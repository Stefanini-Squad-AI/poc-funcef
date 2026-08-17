// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Augusto
// Data        : 18/11/2004
// Pendencia   : 17431
// Alteração   : Não precisar clicar duas vezes no Ok
//------------------------------------------------------------------------------
unit FInformaSalRetroEv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Db, DBTables, Wwquery;

type
  TfrmInformaSalRetroEv = class(TfrmOkCancelar)
    stgridresult: TStringGrid;
    qryAux: TwwQuery;
    qrySalario: TwwQuery;
    qryParticip: TwwQuery;
    bbtnReplicar: TBitBtn;
    procedure stgridresultKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure stgridresultSelectCell(Sender: TObject; Col, Row: Integer; 
      var CanSelect: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnReplicarClick(Sender: TObject);
  private
    { Private declarations }
    slSalarioInicial,
    sIdRubrica, sDataInicio, sDataFinal, sSalario  : string;
    iIdPessoa,  iIdPessJur  : LongInt;
    bSel       : boolean;

  public
    { Public declarations }
  end;

var
  frmInformaSalRetroEv: TfrmInformaSalRetroEv;

  function AbreTelaInformaSalariosRetro(psIdRubrica, psDataInicio, psDataFinal : string;
                                        piIdPessoa,  piIdPessJur               : LongInt;
                                        stGridResult                           : TStringGrid;
                                        psTitulo                               : string;
                                        psSalarioInicial                       : string ) : Boolean;


implementation

uses DAprev, UDataBase, USistema, UAdmPREV, DBaseDados, UMensErro, UFuncoesUteis;

{$R *.DFM}

function AbreTelaInformaSalariosRetro(psIdRubrica, psDataInicio, psDataFinal : string;
                                      piIdPessoa,  piIdPessJur               : LongInt;
                                      stGridResult                           : TStringGrid;
                                      psTitulo                               : string;
                                      psSalarioInicial                       : string ) : Boolean;

var I, C : Integer;

begin
  Application.CreateForm(TfrmInformaSalRetroEv, frmInformaSalRetroEv);
  with frmInformaSalRetroEv do
  begin
     sIdRubrica  := psIdRubrica;
     sDataInicio := psDataInicio;
     sDataFinal  := psDataFinal;
     iIdPessoa   := piIdPessoa;
     iIdPessJur  := piIdPessJur;
     slSalarioInicial := psSalarioInicial;
     if Trim(psTitulo) = ''
     then Caption := 'Informa Salários Retroativos (Ativo)'
     else Caption := psTitulo;
  end;
  frmInformaSalRetroEv.ShowModal;

  stgridresult.RowCount := frmInformaSalRetroEv.stgridresult.RowCount;
  stgridresult.ColCount := frmInformaSalRetroEv.stgridresult.ColCount;

  for I:=0 to frmInformaSalRetroEv.stgridresult.RowCount-1 do
  begin
      for C:=0 to frmInformaSalRetroEv.stgridresult.ColCount-1 do
          stgridresult.Cells[C, I] := frmInformaSalRetroEv.stgridresult.Cells[C, I];
  end;

  frmInformaSalRetroEv.Free;
  Result := True;
end;

procedure TfrmInformaSalRetroEv.stgridresultKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (ssShift in Shift) and (Key = 40) then
  begin
     bSel   := true;
  end
  else bSel := false;
end;

procedure TfrmInformaSalRetroEv.stgridresultSelectCell(Sender: TObject;
  Col, Row: Integer; var CanSelect: Boolean);
var I : Integer;
begin
  inherited;
  if (bSel) then
  begin
     try
        if row-1 = 0 then exit;
        stgridresult.Cells[col,row]  :=  stgridresult.Cells[col,row-1];
     except end;
  end;

  for I:=1 to stgridresult.RowCount-1 do
      if stgridresult.Cells[2, I] <> ''
      then stgridresult.Cells[2, I] := ClienteNumero(FormatFloat('#0.00',StrToFloat(ClienteNumero(stgridresult.Cells[2, I]))));
end;

procedure TfrmInformaSalRetroEv.bbtnConfirmarClick(Sender: TObject);
var   I: Integer;
begin
  qryAux.Close;
  for I:=1 to stgridresult.RowCount-1 do
  begin
    if (stgridresult.Cells[2, I] = '') or  (stgridresult.Cells[2, I] = '0.00') or
       (stgridresult.Cells[2, I] = '0,00') then
    begin
       if MsgDlg('Existe salário não informado. Confirma ? ','Confirmação',mtConfirmation,[mbYes, mbNo],0) = mrNo
       then begin
         stgridresult.SetFocus;
         Exit;
       end
       Else Begin
        bbtnConfirmar.ModalResult := mrOk;
        inherited;
        Close;
        Break;
       end;
    end;
  end;
end;

procedure TfrmInformaSalRetroEv.FormShow(Sender: TObject);
var iDifMeses, I : Integer;
    sMesAnoRef: string;
begin
  bbtnConfirmar.ModalResult := mrNone;
  inherited;
  for I:=0 to stgridresult.RowCount-1 do
  begin
      stgridresult.Cells[0, I] := '';
      stgridresult.Cells[1, I] := '';
      stgridresult.Cells[2, I] := '';
  end;

  iDifMeses := CalculaDifMeses(qryAux, sDataInicio, sDataFinal)+ 2; // + 1 P/ O TITULO E + 1 P/ CONSIDERAR O MES DE INICIO
  if iDifMeses <= 0 then Exit;

  stgridresult.RowCount     := iDifMeses;
  stgridresult.Cells[0, 0]  := 'Participante';
  stgridresult.Cells[1, 0]  := 'Mês Referência';
  stgridresult.Cells[2, 0]  := 'Salário Participação';

  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add('select nome from pessoa where idpessoa = '+IntToStr(iIdPessoa));
  qryAux.Open;
  stgridresult.Cells[0, 1]  := qryAux.FieldByName('NOME').AsString;
  qryAux.Close;

  sMesAnoRef  := Copy(sDataInicio,7,4)+'/'+Copy(sDataInicio,4,2);

  for I:=1 to stgridresult.RowCount-1 do
  begin
      // Verificar se salário já existe neste mes
      qrySalario.Close;
      qrySalario.ParamByName('IDPESSOA').AsInteger := iIdPessoa;
      qrySalario.ParamByName('IDPESSJUR').AsInteger:= iIdPessJur;
      qrySalario.ParamByName('IDRUBRICA').AsInteger:= StrToInt(sIdRubrica);
      qrySalario.ParamByName('MES').AsString       := sMesAnoRef;
      qrySalario.Open;
      if not qrySalario.IsEmpty
      then sSalario := qrySalario.FieldByName('VALORPROVENTO').AsString
      else sSalario := '0.00';

      qryParticip.Close;
      qryParticip.ParamByName('IDPESSOA').AsInteger  := iIdPessoa;
      qryParticip.ParamByName('IDPESSJUR').AsInteger := iIdPessJur;
      qryParticip.Open;

      stgridresult.Cells[1, I] := sMesAnoRef;
      stgridresult.Cells[2, I] := sSalario;

      sMesAnoRef   := ProximoAnoMes(StrToInt(Copy(sMesAnoRef,6,2)), StrToInt(Copy(sMesAnoRef, 1,4)));
  end;

  if (Trim(slSalarioInicial) <> '') and (StrToFloat(ClienteNumero(slSalarioInicial)) > 0)
  then stgridresult.Cells[2, 1] := slSalarioInicial;

end;

procedure TfrmInformaSalRetroEv.bbtnReplicarClick(Sender: TObject);
var sSalarioAtual : string;

    iLinhaInicio,
    iLinhaAtual   : integer;

begin
  inherited;

  sSalarioAtual := stgrIdResult.Cells[2, stgrIdResult.Row];
  iLinhaInicio  :=  stgrIdResult.Row+1;

  for iLinhaAtual := iLinhaInicio to stgrIdResult.rowcount - 1 do
  begin
     stgrIdResult.Cells[2, iLinhaAtual] := sSalarioAtual;
  end;



end;

end.


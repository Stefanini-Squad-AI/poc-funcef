unit FAcertaCusto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwtable, Wwdatsrc, ComCtrls;

type
  TfrmAcertaCusto = class(TfrmOkCancelar)
    Panel1: TPanel;
    Label1: TLabel;
    rgHonor: TRadioGroup;
    ds: TwwDataSource;
    tblProcesso: TwwTable;
    tblProcessoNUMPROCTRAB: TFloatField;
    tblProcessoCUSTOPROC: TFloatField;
    tblObjeto: TwwTable;
    tblObjetoVALORRECL: TFloatField;
    tblObjetoPERCPROB: TFloatField;
    tblObjetoValorEsperado: TFloatField;
    tblObjetoVALORSENTENCA: TFloatField;
    tblObjetoNUMPROCTRAB: TFloatField;
    tblObjetoCODTIPOOBJETO: TFloatField;
    tblHonor: TwwTable;
    tblHonorVALORHONOR: TFloatField;
    tblHonorNUMPROCTRAB: TFloatField;
    tblProcessoFLGSITPROC: TFloatField;
    tblHonorIDFORNSERV: TFloatField;
    prgBar: TProgressBar;
    tblProcessoDESPESAPROC: TFloatField;
    tblEtapa: TwwTable;
    tblEtapaNUMSEQ: TFloatField;
    tblEtapaDATAREALOCOR: TDateTimeField;
    tblEtapaNUMPROCTRAB: TFloatField;
    tblEtapaVALORREC: TFloatField;
    rgDespe: TRadioGroup;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure tblObjetoCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAcertaCusto: TfrmAcertaCusto;

implementation

uses UMensErro;
{$R *.DFM}

procedure TfrmAcertaCusto.bbtnConfirmarClick(Sender: TObject);
var
  TotCusto, TotDespe : Double;
  TotAcert, TotReg, RegLido : Integer;
begin
  inherited;
  if MsgDlg('Confirma a Execução do Procedimento ?', LerMensagem(4),
                 mtConfirmation, [mbYes, mbNo], 0) <> mrYes
  then exit;

  TotAcert := 0;
  RegLido  := 0;
  if  not  tblProcesso.Active  then  tblProcesso.Open;
  if  not  tblObjeto.Active    then  tblObjeto.Open;

  if  rgHonor.ItemIndex = 1  then  tblHonor.Close
  else  if  not  tblHonor.Active  then  tblHonor.Open;

  if  rgDespe.ItemIndex = 1  then  tblEtapa.Close
  else  if  not  tblEtapa.Active  then  tblEtapa.Open;

  tblProcesso.First;
  TotReg := tblProcesso.RecordCount;
  prgBar.Visible := True;
  while  not  tblProcesso.Eof  do begin
     TotCusto := 0;
     TotDespe := 0;
     RegLido := RegLido + 1;
     prgBar.Position := Round(RegLido * 100 / TotReg);
     tblObjeto.First;
     while  not  tblObjeto.Eof  do begin
         if  tblProcessoFLGSITPROC.Value = 0
         then  TotCusto := TotCusto + tblObjetoVALORESPERADO.Value
         else  TotCusto := TotCusto + tblObjetoVALORSENTENCA.Value;
         tblObjeto.Next;
     end;
     if  rgHonor.ItemIndex = 0  then begin
         tblHonor.First;
         while  not  tblHonor.Eof  do begin
            TotDespe := TotDespe + tblHonorVALORHONOR.Value;
            tblHonor.Next;
         end;
     end;
     if  rgDespe.ItemIndex = 0  then begin
         tblEtapa.First;
         while  not  tblEtapa.Eof  do begin
            TotDespe := TotDespe + tblEtapaVALORREC.Value;
            tblEtapa.Next;
         end;
     end;
     if  (TotCusto <> tblProcessoCUSTOPROC.Value) or
         (TotDespe <> tblProcessoDESPESAPROC.Value) then begin
         tblProcesso.Edit;
         tblProcessoCUSTOPROC.Value := TotCusto;
         tblProcessoDESPESAPROC.Value := TotDespe;
         tblProcesso.Post;
         TotAcert := TotAcert + 1;
     end;
     tblProcesso.Next;
  end;
  prgBar.Visible := False;
  MsgDlg('Procedimento Concluído: ' + IntToStr(TotAcert) + ' Processo(s) Acertado(s)',
                'Aviso',mtInformation,[mbOk, mbHelp], 0);
  bbtnSairClick(Self);

end;

procedure TfrmAcertaCusto.tblObjetoCalcFields(DataSet: TDataSet);
begin
  inherited;
  tblObjetoVALORESPERADO.Value := Round((tblObjetoVALORRECL.Value *
                                   tblObjetoPERCPROB.Value)) / 100;
end;

end.

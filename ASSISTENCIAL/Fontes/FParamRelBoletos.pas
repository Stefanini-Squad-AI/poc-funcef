unit FParamRelBoletos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, wwdblook,
  CMDBLookupCombo, Mask, wwdbedit, Wwdbspin, Spin, ComCtrls;

type
  TFrmParamRelBoletos = class(TfrmOkCancelar)
    Label2: TLabel;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    dtpData: TDateTimePicker;
    Label1: TLabel;
    dtpDataF: TDateTimePicker;
    chkExcel: TCheckBox;
    SaveDialog: TSaveDialog;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Fazqry;
    procedure GeraExcel;
  private
    { Private declarations }
    ExcelApp, Sheet:Variant;
  public
    { Public declarations }
  end;

var
  FrmParamRelBoletos: TFrmParamRelBoletos;

implementation

{$R *.DFM}

Uses UMensErro, UAdmAss, dRelAssistencial, ComObj, fAguarde;

procedure TFrmParamRelBoletos.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  frmAguarde.Mostra('Aguarde.  Montando relatório...');
  fazqry;
end;

procedure TFrmParamRelBoletos.FormShow(Sender: TObject);
begin
  inherited;
  dtpData.Date:=now-30;
  dtpDataF.Date:=now;
end;

procedure TFrmParamRelBoletos.Fazqry;
var
 vSQL : string;
begin
  (* Exibe o frmAguarde mostrando a mensagem abaixo para o usuário *)
  frmAguarde.Mostra('Aguarde.  Montando relatório...');
  (* Monta a SQL de Consulta para o report *)
  vSQL :=        ' SELECT /*+ INDEX (DOCUMENTO XPKDOCUMENTO) */ '                                          +
                 '  V.INSCRICAONUMERO, ' +
                 '  D.CODDOCUMENTO, ' +
                 '  D.NOSSONUMERO, ' +
                 '  TB.LOCAL, ' +
                 '  P.NOME, ' +
                 '  R.VALOR, ' +
                 '  D.CODPORTFORMA, ' +
                 '  S.DESCRICAO ' +
                 '  FROM ' +
                 '   PESSOA       P, ' +
                 '   DEPENTIT     T, ' +
                 '   PARTPREVPLAN V, ' +
                 '   RATEIODOCUM  R, ' +
                 '   DOCUMENTO    D, ' +
                 '   (SELECT IDSITPART, DESCRICAO ' +
                 '      FROM SITPART) S, ' +
                 '   (SELECT IDPESSOA, NOME AS LOCAL ' +
                 '      FROM PESSOA ' +
                 '      WHERE IDPESSOA IN(1,99)) TB ' +
                 '  WHERE ' +
                 '   P.IDPESSOA   = T.IDPESSOA                             AND ' +
                 '   T.IDPESSOA   = D.IDFORCLI                             AND ' +
                 '   D.IDMODULO = 17                                       AND ' +
                 '   D.CODPORTFORMA IN(337,355,375,376)                    AND ' +
                 '   D.IDFORCLI = T.IDPESSOA                               AND ' +
                 '   R.CODDOCUMENTO = D.CODDOCUMENTO                       AND ' +
                 '   DATAVENCTO >= TO_DATE('''+DateToStr(DtpData.Date)+''',''DD/MM/YYYY'')  AND ' +
                 '   DATAVENCTO <= TO_DATE('''+DateToStr(DtpDataF.Date)+''',''DD/MM/YYYY'')  AND ' +
                 '   V.IDPESSOA  = T.IDTITULAR                             AND ' +
                 '   V.IDSITPART = S.IDSITPART                             AND ' +
                 '   V.IDPESSJUR = TB.IDPESSOA ' +
                 '  ORDER BY D.CODPORTFORMA, P.NOME ';
  dtmRelAssistencial.qryRelBoletos.Close;
  dtmRelAssistencial.qryRelBoletos.SQL.Clear;
  dtmRelAssistencial.qryRelBoletos.SQL.Add(vSQL);
  dtmRelAssistencial.qryRelBoletos.Open;
  If chkExcel.Checked Then GeraExcel;
  dtmRelAssistencial.qryRelBoletos.Close;
  dtmRelAssistencial.qryRelBoletos.Open;
  dtmRelAssistencial.rpRelBoletosLabel2.Caption:='Período: '+DateToStr(dtpData.Date)+' até '+
                                                             DateToStr(dtpDataF.Date);
  if dtmRelAssistencial.qryRelBoletos.IsEmpty then frmAguarde.Apaga;
end;

procedure TFrmParamRelBoletos.GeraExcel;
Var
 i : Integer;
Begin
 If SaveDialog.Execute Then
  Begin
   (* Conecta com o Excel *)
   ExcelApp := IDispatch(ExcelApp);
   ExcelApp := CreateOleObject('Excel.Application');
   (* Não permite o usuário visualizar o processo *)
   ExcelApp.Visible := False;
   (* Cria o arquivo *)
   ExcelApp.Workbooks.Add;
   Application.ProcessMessages;
   Sheet := ExcelApp.ActiveWorkbook.WorkSheets['Plan1'];
   Application.ProcessMessages;
   (* Inicializando contador *)
   i := 1;
   Sheet.Columns[7].NumberFormat := '@';
   (* Inicia Processamento *)
   dtmRelAssistencial.qryRelBoletos.First;
   while not dtmRelAssistencial.qryRelBoletos.EOF do begin
     Application.ProcessMessages;
     (* Gravando Identificador *)
     Sheet.Cells[i,1] := dtmRelAssistencial.qryRelBoletosINSCRICAONUMERO.AsString;
     (* Gravando Situação *)
     Sheet.Cells[i,2] := dtmRelAssistencial.qryRelBoletosDESCRICAO.AsString;
     (* Gravando Plano *)
     Case dtmRelAssistencial.qryRelBoletosCODPORTFORMA.AsInteger Of
      337 : Sheet.Cells[i,3] := 'Assistência Médica Hospitalar';
      355 : Sheet.Cells[i,3] := 'Assistência Odontológica';
      375 : Sheet.Cells[i,3] := 'Assistência Funeral';
      376 : Sheet.Cells[i,3] := 'Seguro de Vida';
     End;
     (* Gravando Nosso Numero *)
     Sheet.Cells[i,4] := dtmRelAssistencial.qryRelBoletosNOSSONUMERO.AsString;
     (* Gravando Nome do Participante *)
     Sheet.Cells[i,5] := dtmRelAssistencial.qryRelBoletosNOME.AsString;
     (* Gravando Local *)
     Sheet.Cells[i,6] := dtmRelAssistencial.qryRelBoletosLOCAL.AsString;
     (* Gravando Valor *)
     Sheet.Cells[i,7] := dtmRelAssistencial.qryRelBoletosVALOR.AsFloat;
     (* incrementando o contador *)
     i := i + 1;
     dtmRelAssistencial.qryRelBoletos.Next;
     Application.ProcessMessages;
   end;(* while *)
   (* Fecha o Arquivo Independente do resultado da Operação *)
   ExcelApp.ActiveWorkbook.SaveAs(SaveDialog.FileName);
   ExcelApp.ActiveWorkbook.Close(False);
   ExcelApp.Quit;
  End;
End;

end.

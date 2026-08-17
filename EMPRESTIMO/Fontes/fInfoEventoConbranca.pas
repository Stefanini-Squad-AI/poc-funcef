{------------------------------------------------------------------------------------|
|-----------------------------HISTÓRICO DE ALTERAÇÕES--------------------------------|
|------------------------------------------------------------------------------------|
--------------------------------------------------------------------------------
//Nº WO..............: 18970
//Data da Alteração..: 13/03/2025
//Responsável........: Leandro Pocebon
//Descrição..........: retira quebra linha no final do campo observação.
//************************************************************************************
//Nº SOL.............: SIG88012
//Data da Alteração..: 27/06/2019
//Alteração Form.....: Alteração do tamanho da tela para aumentar o tamanho do campo
//                     "Evento de Cobranca"
//Responsável........: Fabio Sampaio
//Descrição..........: Alteração do tamanho da tela para aumentar o tamanho do campo
//                     "Evento de Cobranca"
//************************************************************************************
//Nº SOL.............: 259673/17860
//Nº PPM.............: 1132003
//Data da Alteração..: 13/11/2015
//Alteração Form.....: Inserção dos campos
//Responsável........: Darivaldo Alencar
//Descrição..........: Inserção dos campos: NUMCRM,DTAJUIZAMENTO,JURISDICAO
//************************************************************************************
//Nº SOL.............: 219116/16182
//Nº PPM.............: 422309
//Data da Alteração..: 08/12/2014
//Alteração Form.....: Criação do Formulário
//Responsável........: William Santana
//Descrição..........: Criação da Funcionalidade                                     
//************************************************************************************
}


unit fInfoEventoConbranca;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, Db,
  DBTables, Wwquery, dBaseDados, wwdblook, uMensErro, CMDBLookupCombo, ComObj, OleServer,
  DBCtrls;

type
  TFrmInfoEventoCobranca = class(TfrmSairAjuda)
    btnAProcessar: TBitBtn;
    lblArquv: TLabel;
    lblObs: TLabel;
    lblDtEvento: TLabel;
    lblEventoCobranca: TLabel;
    edtArqEventoCobranca: TEdit;
    grpIncluiObs: TGroupBox;
    chkProcJud: TCheckBox;
    chkCE: TCheckBox;
    chkAR: TCheckBox;
    chkNUP: TCheckBox;
    btnLimpaPart: TBitBtn;
    btnProcurar: TBitBtn;
    Dialog: TOpenDialog;
    qryEvCobranca: TwwQuery;
    dsEvCobranca: TDataSource;
    qryHstCobrEmptmo: TwwQuery;
    updHstCobrEmptmo: TUpdateSQL;
    mmoObs: TMemo;
    tmpDtEvento: TCMDateTimePicker;
    cmbEventoCobranca: TDBLookupComboBox;
    qryAux: TwwQuery;
    chkNumCRM: TCheckBox;
    chkDtAjuizamento: TCheckBox;
    chkJurisdicao: TCheckBox;
    qryHstCobrEmptmoIDHISTEVENTOCOBEMPTMO: TFloatField;
    qryHstCobrEmptmoIDTIPOEVENTOCOBEMPTMO: TFloatField;
    qryHstCobrEmptmoIDCONTRATOEMPTMO: TFloatField;
    qryHstCobrEmptmoDATAEVENTOCOB: TDateTimeField;
    qryHstCobrEmptmoOBSCOB: TMemoField;
    qryHstCobrEmptmoCE: TStringField;
    qryHstCobrEmptmoAR: TStringField;
    qryHstCobrEmptmoSITAR: TFloatField;
    qryHstCobrEmptmoNUP: TStringField;
    qryHstCobrEmptmoPROCJUD: TStringField;
    qryHstCobrEmptmoNUMCRM: TFloatField;
    qryHstCobrEmptmoDTAJUIZAMENTO: TDateTimeField;
    qryHstCobrEmptmoJURISDICAO: TStringField;
    procedure btnProcurarClick(Sender: TObject);
    procedure btnLimpaPartClick(Sender: TObject);
    procedure btnAProcessarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

  protected
    function ValidaCampos():boolean;
    function ProcessaArquivo():boolean;
    function ValidaArquivo(Excel: Variant):boolean;
    function UltimaLinha(Excel : Variant; var linha: Integer) : Boolean;
    function PreencheObs(obs: String):String;
    function toFloat(texto : String): Double;
    function preparainfoObsCob(obs:string):String;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmInfoEventoCobranca: TFrmInfoEventoCobranca;

implementation

{$R *.DFM}

uses
  fprogresso;

  
procedure TFrmInfoEventoCobranca.FormShow(Sender: TObject);
begin
  inherited;
  qryEvCobranca.close;
  qryEvCobranca.open;
end;

procedure TFrmInfoEventoCobranca.btnProcurarClick(Sender: TObject);
begin
  inherited;
  dialog.Filter := '*.xls|*.xlsx';
  if not dialog.Execute then
    Exit
  else
      edtArqEventoCobranca.Text := ExtractFileName(dialog.FileName);

end;


procedure TFrmInfoEventoCobranca.btnLimpaPartClick(Sender: TObject);
begin
  inherited;
  edtArqEventoCobranca.Clear;
end;

procedure TFrmInfoEventoCobranca.btnAProcessarClick(Sender: TObject);   
begin
  inherited;

  if not(ValidaCampos) then
    Exit;

  if (ProcessaArquivo) then
   MsgDlg('Processo realizado com sucesso.','Informação',mtInformation,[mbOk],0);

end;

function TFrmInfoEventoCobranca.toFloat(texto : String): Double;
var
  x : Double;
  i: integer;
begin
  for i := 1 to length(texto) do
    if not(texto[i] in ['0'..'9',DecimalSeparator]) then
    begin
      result := 0;
      exit;
    end;

  try
   x := StrToFloat(texto) ;
   result := x;
  except           
   result := 0;
  end;
end;

function TFrmInfoEventoCobranca.ValidaCampos():boolean;
begin

  result := false;

  if (edtArqEventoCobranca.text = EmptyStr) then
  begin
     MsgDlg('Nenhum arquivo com os contratos e informações do evento de cobrança foi indicado.','Erro',mtError,[mbOk],0);
     Exit;
  end;

  if (tmpDtEvento.Text = EmptyStr) then
  begin
     MsgDlg('Informe a data do evento.','Erro',mtError,[mbOk],0);
     Exit;
  end;

  if (cmbEventoCobranca.Text = EmptyStr) then
  begin
     MsgDlg('Informe o evento de cobrança.','Erro',mtError,[mbOk],0);
     Exit;
  end;

  result := true;
end;


function TFrmInfoEventoCobranca.processaArquivo():boolean;
var
Excel : Variant;
linha, numRegs, cont: integer;
contrato, ce, ar, sitar, nup, procjud, numcrm, dtajuizamento, jurisdicao: string;
begin

   Excel := CreateOleObject('Excel.application');
   Excel.Visible := False;
   //abre arquivo em modo somente leitura
   Excel.WorkBooks.Open(ExpandUNCFileName(dialog.FileName),1);
   
  try
    //valida se campos do excel estão corretos
    if not(ValidaArquivo(Excel)) then
    begin
       MsgDlg('O arquivo informado não é válido.','Erro',mtError,[mbOk],0);
       Exit;
    end;

    if not dtmBaseDados.dbBaseDados.InTransaction then
           dtmBaseDados.dbBaseDados.StartTransaction;

    //pega numero total de regitros no aquivo excel
     numRegs := 0;
     linha :=2;

    while not(UltimaLinha(Excel, linha)) do
    begin
      inc(numRegs);
      inc(linha);
    end;

     frmProgresso.MostraFormProgresso('Processando Arquivo...',
                                      True,
                                      True,
                                      True,
                                      0,
                                      numRegs
                                     );
     frmProgresso.btnCancelar.Visible := False;
     frmProgresso.Refresh;

    //processo arquivo
    try
      linha := 2;

      while not(UltimaLinha(Excel, linha)) do
      begin
        contrato     := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 1].Value));
        ce           := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 2].Value));
        ar           := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 3].Value));
        sitar        := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 4].Value));
        nup          := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 5].Value));
        procjud      := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 6].Value));
        //Darivaldo Alencar 259673 -- SOL 259673 ppm-1132003- inicio
        numcrm       := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 7].Value));
        dtajuizamento:= Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 8].Value));
        jurisdicao   := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 9].Value));
        //Darivaldo Alencar 259673 -- SOL 259673 ppm-1132003- fim
        qryHstCobrEmptmo.Close;
        qryHstCobrEmptmo.ParamByName('IDTIPOEVENTOCOBEMPTMO').AsInteger := StrToInt(VarToStr(cmbEventoCobranca.KeyValue));
        qryHstCobrEmptmo.ParamByName('IDCONTRATOEMPTMO').AsString       := contrato ;
        qryHstCobrEmptmo.ParamByName('DATAEVENTOCOB').AsString          := tmpDtEvento.text;
        qryHstCobrEmptmo.Open;

        if qryHstCobrEmptmo.IsEmpty then
        begin
         //qryHstCobrEmptmo.Insert;
//
//         qryAux.close;
//         qryAux.SQL.clear;
//         qryAux.SQL.Add('SELECT SEQHISTEVENTOCOBEMPTMO.NEXTVAL AS SEQ FROM DUAL');
//         qryAux.Open;
//
//         qryHstCobrEmptmoIDHISTEVENTOCOBEMPTMO.AsInteger := qryAux.FieldByName('SEQ').AsINteger;
//         qryHstCobrEmptmoIDTIPOEVENTOCOBEMPTMO.AsInteger := StrToInt(VarToStr(cmbEventoCobranca.KeyValue));
//         qryHstCobrEmptmoIDCONTRATOEMPTMO.AsFloat        := ToFloat(contrato);
//         qryHstCobrEmptmoDATAEVENTOCOB.AsDateTime        := tmpDtEvento.DateTime;
//         qryHstCobrEmptmoCE.AsString                     := ce;
//         qryHstCobrEmptmoAR.AsString                     := ar;
//         qryHstCobrEmptmoSITAR.AsFloat                   := ToFloat(sitar);
//         qryHstCobrEmptmoNUP.AsString                    := nup;
//         qryHstCobrEmptmoPROCJUD.AsString                := procjud;
//         qryHstCobrEmptmoOBSCOB.AsString                 := PreencheObs('');
//
//         qryHstCobrEmptmo.Post;
        end
        else
        begin
         qryHstCobrEmptmo.Edit;

         //a informação já existente deverá ser sobrescrita,
         // para os campos nulos ou brancos a informação existente deverá ser mantida.
         qryHstCobrEmptmoOBSCOB.AsString := preparainfoObsCob(qryHstCobrEmptmoOBSCOB.AsString);

         if (ce <> EmptyStr) then
           qryHstCobrEmptmoCE.AsString      := ce;
         if (ar <> EmptyStr) then
           qryHstCobrEmptmoAR.AsString      := ar;
         if (sitar <> EmptyStr) then
           qryHstCobrEmptmoSITAR.AsFloat    := toFloat(sitar);
         if (nup <> EmptyStr) then
           qryHstCobrEmptmoNUP.AsString     := nup;
         if (procjud <> EmptyStr) then
           qryHstCobrEmptmoPROCJUD.AsString := procjud;
         if (numcrm <> EmptyStr) then
         //Darivaldo Alencar 259673 -- SOL 259673 ppm-1132003- inicio
           qryHstCobrEmptmoNUMCRM.AsString := numcrm;
         if (dtajuizamento <> EmptyStr) then
           qryHstCobrEmptmoDTAJUIZAMENTO.AsString := dtajuizamento;
         if (jurisdicao <> EmptyStr) then
           qryHstCobrEmptmoJURISDICAO.AsString := jurisdicao;
         //Darivaldo Alencar 259673 -- SOL 259673 ppm-1132003- fim
         qryHstCobrEmptmoOBSCOB.AsString  := PreencheObs(qryHstCobrEmptmoOBSCOB.AsString);

         qryHstCobrEmptmo.Post;
        end;

        inc(linha);
        qryHstCobrEmptmo.ApplyUpdates;
        frmProgresso.AndaFormProgresso(linha-1);
        frmProgresso.Refresh;
      end;
      
      if dtmBaseDados.dbBaseDados.InTransaction then
                      dtmBaseDados.dbBaseDados.Commit;

      result := true;

    except

     if dtmBaseDados.dbBaseDados.InTransaction then
                      dtmBaseDados.dbBaseDados.Rollback;
     result := false;
    end;

  finally
    Excel.ActiveWorkBook.Saved:= 1;
    Excel.DisplayAlerts:= 0;
    Excel.ActiveWorkBook.Close(SaveChanges:= 0);
    Excel.Workbooks.Close;
    Excel.Quit;
    Excel := Unassigned;

    frmProgresso.EscondeFormProgresso;    
  end;
end;

function TFrmInfoEventoCobranca.validaArquivo(Excel: Variant):boolean;
begin
     Result := False;
    // Para validar o Layout é verificado se os campos estão na ordem como foi especificado, e os nomes dos campos também devem estar corretos
    if AnsiUpperCase(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[1,1].Value)))  = 'CONTRATO' then
    if AnsiUpperCase(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[1,2].Value)))  = 'CE' then
    if AnsiUpperCase(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[1,3].Value)))  = 'AR' then
    if AnsiUpperCase(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[1,4].Value)))  = 'SITAR' then
    if AnsiUpperCase(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[1,5].Value)))  = 'NUP' then
    if AnsiUpperCase(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[1,6].Value)))  = 'PROCJUD' then
    //Darivaldo Alencar 259673 -- SOL 259673 ppm-1132003- inicio
    if AnsiUpperCase(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[1,7].Value)))  = 'NUMCRM' then
    if AnsiUpperCase(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[1,8].Value)))  = 'DTAJUIZAMENTO' then
    if AnsiUpperCase(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[1,9].Value)))  = 'JURISDICAO' then
    //Darivaldo Alencar 259673 -- SOL 259673 ppm-1132003- fim

     Result := True;

end;

function TFrmInfoEventoCobranca.UltimaLinha(Excel : Variant; var linha: Integer) : Boolean;
var
  b : boolean;
  cont : integer;
begin
  b := False;
  if (Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 1].Value)) = '') and
     (Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 2].Value)) = '') and
     (Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 3].Value)) = '') and
     (Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 4].Value)) = '') and
     (Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 5].Value)) = '') and
     //Darivaldo Alencar 259673 -- SOL 259673 ppm-1132003- inicio
     (Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 6].Value)) = '') and
     (Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 7].Value)) = '') and
     (Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 8].Value)) = '') then
     //Darivaldo Alencar 259673 -- SOL 259673 ppm-1132003- fim
  b := True;

  if b then
  for cont := 0 to 8 do
  begin
    inc(linha);
    if (Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 1].Value)) = '') and
       (Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 2].Value)) = '') and
       (Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 3].Value)) = '') and
       (Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 4].Value)) = '') and
       (Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 5].Value)) = '') and
       //Darivaldo Alencar 259673 -- SOL 259673 ppm-1132003- inicio
       (Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 6].Value)) = '') and
       (Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 7].Value)) = '') and
       (Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 8].Value)) = '') then
       //Darivaldo Alencar 259673 -- SOL 259673 ppm-1132003- fim
     b := True
    else
    begin
      b := false;
      break;
    end;
  end;

  Result := b;
end;


function TFrmInfoEventoCobranca.PreencheObs(obs: String):String;
var
  obsCob: String;
begin
  //verifica se campo OBSCOB já tem as informações, se não tiver, adiciona, se tiver sobrescreve

   if (mmoObs.text <> EmptyStr) then
   begin
    //se foi escrito Observação, troca o que já havia na base, no caso de edição do registro
    //WO18970 Leandro inicio
    obsCob := mmoObs.text;
    if (Copy(obsCob, Length(obsCob) - 1, 2) = #13#10) then
       Delete(obsCob, Length(obsCob) - 1, 2); // Remove o CRLF final

    //obsCob := mmoObs.text + ', ';
    obsCob :=  obsCob + ', ';
    //WO18970 Leandro fim

   end
   else
    obsCob := trim(qryHstCobrEmptmoOBSCOB.AsString) + ', ';

   if (chkCE.Checked) and (qryHstCobrEmptmoCE.AsString <> EmptyStr) then
   obsCob := obsCob + 'CE '+qryHstCobrEmptmoCE.AsString+ ', ';

   if (chkAR.Checked) and (qryHstCobrEmptmoAR.AsString <> EmptyStr) then
   obsCob := obsCob + 'AR '+qryHstCobrEmptmoAR.AsString+ ', ';

   if (chkNUP.Checked) and (qryHstCobrEmptmoNUP.AsString <> EmptyStr) then
   obsCob := obsCob + 'NUP '+qryHstCobrEmptmoNUP.AsString+ ', ';

   if (chkProcJud.Checked) and (qryHstCobrEmptmoPROCJUD.AsString <> EmptyStr) then
   obsCob := obsCob + 'Processo Judicial '+qryHstCobrEmptmoPROCJUD.AsString+ ', ';

   //Darivaldo Alencar 259673 -- SOL 259673 ppm-1132003- inicio
   if (chkNumCRM.Checked) and (qryHstCobrEmptmoNUMCRM.AsString <> EmptyStr) then
   obsCob := obsCob + 'NRº CRM '+qryHstCobrEmptmoNUMCRM.AsString+ ', ';

   if (chkDtAjuizamento.Checked) and (qryHstCobrEmptmoDTAJUIZAMENTO.AsString <> EmptyStr) then
   obsCob := obsCob + 'Data Ajuizamento '+qryHstCobrEmptmoDTAJUIZAMENTO.AsString+ ', ';

   if (chkJurisdicao.Checked) and (qryHstCobrEmptmoJURISDICAO.AsString <> EmptyStr) then
   obsCob := obsCob + 'Jurisdição '+qryHstCobrEmptmoJURISDICAO.AsString+ ', ';
   //Darivaldo Alencar 259673 -- SOL 259673 ppm-1132003- fim

   //troca a ultima vírgula(,) por ponto(.)
   obsCob := trim(obsCob);
   obsCob := copy(obsCob,1,(length(obsCob)- 1)) + '.' ;
   result := obsCob;

end;

//Verifica se no campo OBSCOB já consta a infomação do campo,
//caso positivo, remove para preencher depois com a nova informação.
//tudo isso serve para manter a Observação da tabela caso o campo observação da tela esteja vazio
function TFrmInfoEventoCobranca.preparainfoObsCob(Obs:string):String;
var
  obscob: string ;
begin
   obscob := Obs;

  if (pos(('CE '+qryHstCobrEmptmoCE.AsString),Obs)>0) and (qryHstCobrEmptmoCE.AsString <> EmptyStr) then
    obscob := StringReplace(Obs,(Copy(Obs,(pos(('CE '),Obs)-1),length(Obs))),'', [rfReplaceAll, rfIgnoreCase])
  else
  if (pos(('AR '+qryHstCobrEmptmoAR.AsString),Obs)>0) and (qryHstCobrEmptmoAR.AsString <> EmptyStr) then
    obscob := StringReplace(Obs,(Copy(Obs,(pos(('AR '),Obs)-1),length(Obs))),'', [rfReplaceAll, rfIgnoreCase])
  else
  if (pos(('SITAR '+qryHstCobrEmptmoSITAR.AsString),Obs)>0) and (qryHstCobrEmptmoSITAR.AsString <> EmptyStr) then
    obscob := StringReplace(Obs,(Copy(Obs,(pos(('SITAR '),Obs)-1),length(Obs))),'', [rfReplaceAll, rfIgnoreCase])
  else
  if (pos(('NUP '+qryHstCobrEmptmoNUP.AsString),Obs)>0) and (qryHstCobrEmptmoNUP.AsString <> EmptyStr) then
    obscob := StringReplace(Obs,(Copy(Obs,(pos(('NUP '),Obs)-1),length(Obs))),'', [rfReplaceAll, rfIgnoreCase])
  else
  if (pos(('PROCJUD '+qryHstCobrEmptmoPROCJUD.AsString),Obs)>0) and (qryHstCobrEmptmoPROCJUD.AsString <> EmptyStr) then
    obscob := StringReplace(Obs,(Copy(Obs,(pos(('PROCJUD '),Obs)-1),length(Obs))),'', [rfReplaceAll, rfIgnoreCase])
  else
  //Darivaldo Alencar 259673 -- SOL 259673 ppm-1132003- inicio
  if (pos(('NUMCRM '+qryHstCobrEmptmoNUMCRM.AsString),Obs)>0) and (qryHstCobrEmptmoNUMCRM.AsString <> EmptyStr) then
    obscob := StringReplace(Obs,(Copy(Obs,(pos(('NUMCRM '),Obs)-1),length(Obs))),'', [rfReplaceAll, rfIgnoreCase])
    else
  if (pos(('DTAJUIZAMENTO '+qryHstCobrEmptmoDTAJUIZAMENTO.AsString),Obs)>0) and (qryHstCobrEmptmoDTAJUIZAMENTO.AsString <> EmptyStr) then
    obscob := StringReplace(Obs,(Copy(Obs,(pos(('DTAJUIZAMENTO '),Obs)-1),length(Obs))),'', [rfReplaceAll, rfIgnoreCase])
    else
  if (pos(('JURISDICAO '+qryHstCobrEmptmoJURISDICAO.AsString),Obs)>0) and (qryHstCobrEmptmoJURISDICAO.AsString <> EmptyStr) then
    obscob := StringReplace(Obs,(Copy(Obs,(pos(('JURISDICAO '),Obs)-1),length(Obs))),'', [rfReplaceAll, rfIgnoreCase]);
  //Darivaldo Alencar 259673 -- SOL 259673 ppm-1132003- fim
  //verifica se existe um ponto ou virgula no fim da obeservação
  obscob := trim(obscob);
  while (pos('.',(copy(obscob,length(obscob),1)))>0) or (pos(',',(copy(obscob,length(obscob),1)))>0) do
    obscob := copy(obscob,1,(length(obscob)-1));

  result := obscob;

end;

end.

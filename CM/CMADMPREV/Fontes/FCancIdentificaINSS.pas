unit FCancIdentificaINSS;

// Alterações:
{
--------------------------------------------------------------------------------------------------
Pendência   : SOL 204410 KINTANA 1975892
Responsável : Helio Lima Custodio
Data        : 13/06/2014
Descrição   : Permitir selecionar quais registros para Desfazer Identificação Reembolso INSS 
--------------------------------------------------------------------------------------------------
Pendência   : SOL 133777 KINTANA 782368
Responsável : BRUNO AZEVEDO
Data        : 13/04/2010
Descrição   : No cancelamento, gravar o campo FLGMARGEM = '0'. Alteração nos tipos dos parâmetros:
              CODSINONIMO,DTINICIOCRED,DTFIMCRED.
--------------------------------------------------------------------------------------------------
Pendência   : SOL 131786 KINTANA 753272
Responsável : BRUNO AZEVEDO
Data        : 03/03/2010
Descrição   : Somente salvar o campo DIB (Nas tabelas TEMPCONCINSS e DETCONCINSS)
              NULL ou com data válida.
--------------------------------------------------------------------------------------------------
Autor     : Renato Visoni
Data      : 26/02/2010
Pendência : SOL 123118 Kintana 612606
Descrição : Ajuste na rotina para inserir o campo CODSINONIMO,DTINICIOCRED,DTFIMCRED na
            DetConcInss e TempConcInss.
---------------------------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Db, DBTables,
  Wwquery, Mask, DBCtrls, Wwdatsrc;

type
  TfrmCancIdentificaINSS = class(TfrmOkCancelar)
    Panel2: TPanel;
    DBgrdDetConc: TwwDBGrid;
    edtNumProcessoINSS: TEdit;
    Label1: TLabel;
    btnProcura: TBitBtn;
    qryDetConc: TwwQuery;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    Bevel1: TBevel;
    dtsDetConc: TwwDataSource;
    qryInsertTempConc: TwwQuery;
    qryInsertTempConcIDPESSOA: TFloatField;
    qryInsertTempConcNOME: TStringField;
    qryInsertTempConcCODRUBRICA1: TFloatField;
    qryInsertTempConcCODRUBRICA2: TFloatField;
    qryInsertTempConcCODRUBRICA3: TFloatField;
    qryInsertTempConcCODRUBRICA4: TFloatField;
    qryInsertTempConcVLRRUBRICA1: TFloatField;
    qryInsertTempConcVLRRUBRICA2: TFloatField;
    qryInsertTempConcVLRRUBRICA3: TFloatField;
    qryInsertTempConcVLRRUBRICA4: TFloatField;
    qryInsertTempConcDATALEITURA: TDateTimeField;
    qryInsertTempConcOBS: TStringField;
    qryInsertTempConcMOTIVO: TStringField;
    qryInsertTempConcMESPROCESSAMENTO: TStringField;
    qryInsertTempConcMESREFERENCIA: TStringField;
    qryInsertTempConcNUMPROCINSS: TStringField;
    qryInsertTempConcESPECIE: TStringField;
    qryInsertTempConcCODCONCESSORINSS: TStringField;
    qryInsertTempConcCODMANTENEDORINSS: TStringField;
    qryInsertTempConcMATRICULA: TStringField;
    qryInsertTempConcRMREAJ: TFloatField;
    qryInsertTempConcAPREAJ: TFloatField;
    qryInsertTempConcFLGMANUAL: TFloatField;
    qryInsertTempConcDIB: TDateTimeField;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    qryDetConcIDPESSOA: TFloatField;
    qryDetConcNOME: TStringField;
    qryDetConcMESREFERENCIA: TStringField;
    qryDetConcMESCOBRANCA: TStringField;
    qryDetConcNUMPROCINSS: TStringField;
    qryDetConcDIB: TDateTimeField;
    qryDetConcIDRUBRICA: TFloatField;
    qryDetConcVALORINSS: TFloatField;
    qryDetConcCODCONCESSORINSS: TStringField;
    qryDetConcCODMANTENEDORINSS: TStringField;
    qryDetConcRMREAJ: TFloatField;
    qryDetConcAPREAJ: TFloatField;
    qryDetConcFLGMANUAL: TFloatField;
    qryDetConcFLGTRATADO: TFloatField;
    qryDetConcESPECIE: TStringField;
    qryDetConcOBSERVACAO: TStringField;
    qryDetConcCODPROVDESC: TStringField;
    qryDeleteDetConc: TwwQuery;
    FloatField1: TFloatField;
    StringField1: TStringField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    DateTimeField1: TDateTimeField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    FloatField10: TFloatField;
    FloatField11: TFloatField;
    FloatField12: TFloatField;
    DateTimeField2: TDateTimeField;
    Label5: TLabel;
    Bevel2: TBevel;
    edtNovoNome: TEdit;
    qryDetConcRUBRICAINSS: TFloatField;
    qryDetConcCODSINONIMO: TFloatField;
    qryDetConcDTINICIOCRED: TDateTimeField;
    qryDetConcDTFIMCRED: TDateTimeField;
    updDetConc: TUpdateSQL;
    lblMesCobranca: TLabel;
    edtMesCobranca: TMaskEdit;
    qryDetConcFLGENVIAR: TFloatField;
    qryDetConcSEQUENCIAL: TFloatField;

    procedure btnProcuraClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);


  private // Private declarations

    sNumProcINSS : String;

    function  VerificaPreenchimento: Boolean;
    function  VerificaPreenchimentoProcura: Boolean; //Helio - SOL Nº 204410 KINTANA Nº 1975892
    function  TemRegistroSelecionado: Boolean; //Helio - SOL Nº 204410 KINTANA Nº 1975892

    procedure LimpaTela;  //Helio - SOL Nº 204410 KINTANA Nº 1975892


  public  // Public declarations


  end;



var
  frmCancIdentificaINSS: TfrmCancIdentificaINSS;



implementation
{$R *.DFM}
uses
  uDatabase, uVerificaPreenchimento, uSistema, uMensErro;



procedure TfrmCancIdentificaINSS.btnProcuraClick(Sender: TObject);
begin
  inherited;

  //Helio - SOL Nº 204410 KINTANA Nº 1975892
  if not VerificaPreenchimentoProcura then Exit;
  

  sNumProcINSS := edtNumProcessoINSS.Text;

  qryDetConc.Close;
  if not(qryDetConc.Prepared) then qryDetConc.Prepare;

  qryDetConc.ParamByName('PNUMPROCINSS').AsString := edtNumProcessoINSS.Text;

  //Helio - SOL Nº 204410 KINTANA Nº 1975892
  if Trim(StringReplace(edtMesCobranca.Text, '/', '', [rfReplaceAll, rfIgnoreCase])) <> '' then
        qryDetConc.ParamByName('PMESCOBRANCA').AsString := edtMesCobranca.Text
  else
        qryDetConc.ParamByName('PMESCOBRANCA').AsString := '';
  //FIM Helio - SOL Nº 204410 KINTANA Nº 1975892

  qryDetConc.Open;
end;



function TfrmCancIdentificaINSS.VerificaPreenchimento: Boolean;
begin
  Result := False;

  try
    // ---------------------------------------------------------------------------------------------

    if not(qryDetConc.Active) then
       raise EValidacao.CreateVal('É necessário selecionar um Nº de Processo!', btnProcura);

    if qryDetConc.IsEmpty then
       raise EValidacao.CreateVal('Não há registros com o Nº de Processo indicado!', btnProcura);

    if length(trim(edtNovoNome.Text)) = 0 then
       raise EValidacao.CreateVal('É necessário indicar o "Novo" Nome!', edtNovoNome);

    //Helio - SOL Nº 204410 KINTANA Nº 1975892
    if not TemRegistroSelecionado then
       raise EValidacao.CreateVal('É necessário selecionar pelo menos um dos registros para desfazer a identificação.', DBgrdDetConc);
    // ---------------------------------------------------------------------------------------------

    //Helio - SOL Nº 204410 KINTANA Nº 1975892
    //comenta
    {// O objetivo é travar o processo em caso de haver QUALQUER linha na DetConcInss que não seja
    // resultado de uma identificação manual
    // Assim, só pode haver registros com flgTratado = 2 e flgManual = 0

    qryDetConc.First;
    while not(qryDetConc.EOF) do
    begin
      if (qryDetConcFLGTRATADO.AsInteger <> 2) or (qryDetConcFLGMANUAL.AsInteger <> 0) then
        raise EValidacao.CreateVal('Já existe registro tratado na DetConcINSS. Não é possível desfazer a identificação!', btnProcura);

      qryDetConc.Next;
    end;}
    //FIM Helio - SOL Nº 204410 KINTANA Nº 1975892

    // ---------------------------------------------------------------------------------------------

   except
     on ev : EValidacao do
     begin
       Screen.Cursor := crDefault;
       if ev.Show then MsgDlg(ev.message, 'Folha de Benefícios', mtWarning, [mbOk], 0);
       Repaint;
       if ev.Control.CanFocus then ev.Control.SetFocus;
       Exit;
     end;
   end;

   Result := True;
end;

//Helio - SOL Nº 204410 KINTANA Nº 1975892
function TfrmCancIdentificaINSS.VerificaPreenchimentoProcura: Boolean;
var valorMesCobranca : String;
begin
  Result := True;

  valorMesCobranca := StringReplace(edtMesCobranca.Text, '/', '', [rfReplaceAll, rfIgnoreCase]);
  valorMesCobranca := Trim(valorMesCobranca);

  if (edtNumProcessoINSS.Text = '') or
     ((valorMesCobranca = '') and (edtNumProcessoINSS.Text = '')) then
  begin
      MsgDlg('É necessário informar pelo o Número do Processo do INSS e/ou Mês de Cobrança.', Sistema.NomeModulo, mtInformation, [mbOk], 0);
      Result := False;
      Exit;
  end;

  if (valorMesCobranca <> '' ) and
     (Length(valorMesCobranca) <> 6) then
  begin
      MsgDlg('É necessário informar o mês de cobrança obedecendo ao seguinte formato: AAAA/MM.', Sistema.NomeModulo, mtInformation, [mbOk], 0);
      Result := False;
  end;
  
end;



procedure TfrmCancIdentificaINSS.bbtnConfirmarClick(Sender: TObject);
var
  sMsg : String;
begin
  inherited;

  // -----------------------------------------------------------------------------------------------

  if not(VerificaPreenchimento) then Exit;

  sMsg :=
  'Essa operação irá desfazer a identificação de TODOS os registros ligados ao processo selecionado. ' + #13 + #13 +
  'Deseja realmente prosseguir? ';

  if MsgDlg(sMsg, Sistema.NomeModulo, mtConfirmation, [mbYes, mbNo], 0) = mrNo then
  begin
    MsgDlg('Processo abortado.', Sistema.NomeModulo, mtInformation, [mbOk], 0);
    Repaint;

    Exit;
  end;

  StartTransacao;

  // -----------------------------------------------------------------------------------------------

  // 1º - Insere os registros da DetConc na TempConc

  qryDetConc.First;
  while not(qryDetConc.EOF) do
  begin
    with qryInsertTempConc do
    begin
      qryInsertTempConc.Close;

      //Helio - SOL Nº 204410 KINTANA Nº 1975892
      if qryDetConcFLGENVIAR.AsInteger = 0 then
      begin
          qryDetConc.Next;
          Continue;
      end;
      //FIM Helio - SOL Nº 204410 KINTANA Nº 1975892

      if not(qryInsertTempConc.Prepared) then qryInsertTempConc.Prepare;

      ParamByName('PNUMPROCINSS').AsString        := qryDetConcNUMPROCINSS.AsString;

      ParamByName('PMESPROCESSAMENTO').AsString   := qryDetConcMESCOBRANCA.AsString;
      ParamByName('PMESREFERENCIA').AsString      := qryDetConcMESREFERENCIA.AsString;
      ParamByName('PESPECIE').AsString            := qryDetConcESPECIE.AsString;

      ParamByName('PCODCONCESSORINSS').AsString   := qryDetConcCODCONCESSORINSS.AsString;
      ParamByName('PCODMANTENEDORINSS').AsString  := qryDetConcCODMANTENEDORINSS.AsString;

      ParamByName('PCODRUBRICA1').AsInteger       := qryDetConcRUBRICAINSS.AsInteger;

      ParamByName('PNOME').AsString               := edtNovoNome.Text;
      ParamByName('PMOTIVO').AsString             := 'Desfazer Identificacao';
      ParamByName('PVLRRUBRICA1').AsCurrency      := qryDetConcVALORINSS.AsCurrency;
      ParamByName('PRMREAJ').AsCurrency           := qryDetConcRMREAJ.AsCurrency;

      ParamByName('PAPREAJ').AsCurrency           := qryDetConcAPREAJ.AsCurrency;
      //BRUNO AZEVEDO SOL 131786 KINTANA 753272
      if (qryDetConcDIB.AsDateTime > 0) then begin
        ParamByName('PDIB').AsDateTime              := qryDetConcDIB.AsDateTime;
      end else begin
        ParamByName('PDIB').Clear;
      end;
      //BRUNO AZEVEDO SOL 131786 KINTANA 753272

      ParamByName('POBS').AsString                := qryDetConcOBSERVACAO.AsString;

      //Renato Visoni SOL 123118 Kintana 612606
      ParamByName('PCODSINONIMO').AsString        := qryDetConcCODSINONIMO.AsString;

      if qryDetConcDTINICIOCRED.AsDateTime = 0 then begin
        ParamByName('PDTINICIOCRED').Clear;
      end else begin
        ParamByName('PDTINICIOCRED').AsDateTime     := qryDetConcDTINICIOCRED.AsDateTime;
      end;

      if qryDetConcDTFIMCRED.AsDateTime = 0 then begin
        ParamByName('PDTFIMCRED').Clear;
      end else begin
        ParamByName('PDTFIMCRED').AsDateTime        := qryDetConcDTFIMCRED.AsDateTime;
      end;
      //Renato Visoni SOL 123118 Kintana 612606

      //BRUNO AZEVEDO SOL 133777 KINTANA 782368
      ParamByName('PFLGMANUAL').AsString := '0';

      try
        qryInsertTempConc.ExecSQL;
      except
        RollbackTransacao;

        MsgDlg('Erro ao inserir na TempConcINSS', Sistema.NomeModulo, mtError, [mbOk], 0);
        Repaint;

        Exit;
      end;  // try..except

    end;  // with qryInsertTempConc

    //Helio - SOL Nº 204410 KINTANA Nº 1975892
    try
      qryDeleteDetConc.Close;
      if not(qryDeleteDetConc.Prepared) then qryDeleteDetConc.Prepare;
      qryDeleteDetConc.ParamByName('PNUMPROCINSS').AsString := edtNumProcessoINSS.Text;
      qryDeleteDetConc.ParamByName('PIDRUBRICA').AsString := qryDetConc.FieldByName('IDRUBRICA').AsString;
      qryDeleteDetConc.ParamByName('PMESREFERENCIA').AsString := qryDetConc.FieldByName('MESREFERENCIA').AsString;
      qryDeleteDetConc.ParamByName('PSEQUENCIAL').AsString := qryDetConc.FieldByName('SEQUENCIAL').AsString;
      qryDeleteDetConc.ParamByName('PMESCOBRANCA').AsString := qryDetConc.FieldByName('MESCOBRANCA').AsString;
      qryDeleteDetConc.ParamByName('PRUBRICAINSS').AsString := qryDetConc.FieldByName('RUBRICAINSS').AsString;
      qryDeleteDetConc.ExecSQL;
     except
       RollbackTransacao;

       MsgDlg('Erro ao excluir da DetConcINSS', Sistema.NomeModulo, mtError, [mbOk], 0);
       Repaint;

       Exit;
    end;
    //FIM Helio - SOL Nº 204410 KINTANA Nº 1975892

    qryDetConc.Next;
  end;  // while not(qryDetConc.EOF)

  // -----------------------------------------------------------------------------------------------

  // 2º - Exclui todos os registros da DetConc
  //Helio - SOL Nº 204410 KINTANA Nº 1975892
  //comentado pois os registros agoram serão
  //apagados de 1 por 1 no momento do insert
  {try
    qryDeleteDetConc.Close;
    if not(qryDeleteDetConc.Prepared) then qryDeleteDetConc.Prepare;
    qryDeleteDetConc.ParamByName('PNUMPROCINSS').AsString := edtNumProcessoINSS.Text;
    qryDeleteDetConc.ExecSQL;
  except
    RollbackTransacao;

    MsgDlg('Erro ao excluir da DetConcINSS', Sistema.NomeModulo, mtError, [mbOk], 0);
    Repaint;

    Exit;
  end;}

  // -----------------------------------------------------------------------------------------------

  Committransacao;

  // -----------------------------------------------------------------------------------------------

  Repaint;
  Application.ProcessMessages;

  btnProcuraClick(self);

  edtNovoNome.Clear;

  //Helio - SOL Nº 204410 KINTANA Nº 1975892
  LimpaTela;

  // -----------------------------------------------------------------------------------------------
end;

//Helio - SOL Nº 204410 KINTANA Nº 1975892
function TfrmCancIdentificaINSS.TemRegistroSelecionado: Boolean;
begin

    qryDetConc.First;
    While not qryDetConc.Eof do
    begin
       if qryDetConcFLGENVIAR.AsInteger = 1 then
       begin
          Result := True;
          Exit;
       end; //End If

       qryDetConc.Next;
    end; //End While not qryDetConc.Eof do
    Result := False;
end;

//Helio - SOL Nº 204410 KINTANA Nº 1975892
procedure TfrmCancIdentificaINSS.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  LimpaTela;
end;

//Helio - SOL Nº 204410 KINTANA Nº 1975892
procedure TfrmCancIdentificaINSS.LimpaTela;
begin
  qryDetConc.Close;

  if not(qryDetConc.Prepared) then qryDetConc.Prepare;

  qryDetConc.ParamByName('PNUMPROCINSS').AsString := '-1';

  qryDetConc.Open;


  edtNumProcessoINSS.Text := '';
  edtMesCobranca.Text     := '';
  edtNovoNome.Text        := '';

  edtNumProcessoINSS.SetFocus;
end;

end.

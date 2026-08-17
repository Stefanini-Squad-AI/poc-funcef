unit FCancIdentificaINSS;

// Alterações:
{
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

    procedure btnProcuraClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);


  private // Private declarations

    sNumProcINSS : String;

    function  VerificaPreenchimento: Boolean;


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

  sNumProcINSS := edtNumProcessoINSS.Text;

  qryDetConc.Close;
  if not(qryDetConc.Prepared) then qryDetConc.Prepare;

  qryDetConc.ParamByName('PNUMPROCINSS').AsString := edtNumProcessoINSS.Text;

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

    // ---------------------------------------------------------------------------------------------

    // O objetivo é travar o processo em caso de haver QUALQUER linha na DetConcInss que não seja
    // resultado de uma identificação manual
    // Assim, só pode haver registros com flgTratado = 2 e flgManual = 0

    qryDetConc.First;
    while not(qryDetConc.EOF) do
    begin
      if (qryDetConcFLGTRATADO.AsInteger <> 2) or (qryDetConcFLGMANUAL.AsInteger <> 0) then
        raise EValidacao.CreateVal('Já existe registro tratado na DetConcINSS. Não é possível desfazer a identificação!', btnProcura);

      qryDetConc.Next;
    end;

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

    qryDetConc.Next;
  end;  // while not(qryDetConc.EOF)

  // -----------------------------------------------------------------------------------------------

  // 2º - Exclui todos os registros da DetConc

  try
    qryDeleteDetConc.Close;
    if not(qryDeleteDetConc.Prepared) then qryDeleteDetConc.Prepare;
    qryDeleteDetConc.ParamByName('PNUMPROCINSS').AsString := edtNumProcessoINSS.Text;
    qryDeleteDetConc.ExecSQL;
  except
    RollbackTransacao;

    MsgDlg('Erro ao excluir da DetConcINSS', Sistema.NomeModulo, mtError, [mbOk], 0);
    Repaint;

    Exit;
  end;

  // -----------------------------------------------------------------------------------------------

  Committransacao;

  // -----------------------------------------------------------------------------------------------

  Repaint;
  Application.ProcessMessages;

  btnProcuraClick(self);

  edtNovoNome.Clear;

  // -----------------------------------------------------------------------------------------------
end;



end.

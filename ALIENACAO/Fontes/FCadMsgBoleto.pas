{-------------------------------------------------------------------------------
--------------------------------------------------------------------------------

	   Cadastro de Mensagens para Boleto Bancário

	Autor          :  Vinicius Meyer Lana
	Data de Início :  05/10/2001
	Data de Término:  05/10/2001

--------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência    : 27508
Responsável  : Daniel Simões
Data         : 03/03/2008
Descrição    : Ajustes no Help Context...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}


unit FCadMsgBoleto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, Mask, DBCtrls, FCadastroGridCSImob,
  CmEventosCadastro, ImgList
  {$IFNDEF VERSAO0505} ,uCMTypes {$ENDIF};

type
  TfrmCadMsgBoleto = class(TfrmCadastroGridCSImob)
    dbedDescricao: TDBEdit;
    DBedtLinha1: TDBEdit;
    DBedtLinha2: TDBEdit;
    DBedtLinha3: TDBEdit;
    DBedtLinha4: TDBEdit;
    DBedtLinha5: TDBEdit;
    DBedtLinha6: TDBEdit;
    DBedtLinha7: TDBEdit;
    DBedtLinha8: TDBEdit;
    DBedtLinha9: TDBEdit;
    Label1: TLabel;
    Bevel1: TBevel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    qryDeleteLinha: TwwQuery;
    qryUpdateLinha: TwwQuery;
    qryInsertLinha: TwwQuery;
    qryVerificaOcorrencia: TwwQuery;
    qryVerificaLinha: TwwQuery;
    qryIDMSGBOLETO: TFloatField;
    qryMSGDESCRICAO: TStringField;
    qryLINHA_1: TFloatField;
    qryTEXTOLINHA_1: TStringField;
    qryLINHA_2: TFloatField;
    qryTEXTOLINHA_2: TStringField;
    qryLINHA_3: TFloatField;
    qryTEXTOLINHA_3: TStringField;
    qryLINHA_4: TFloatField;
    qryTEXTOLINHA_4: TStringField;
    qryLINHA_5: TFloatField;
    qryTEXTOLINHA_5: TStringField;
    qryLINHA_6: TFloatField;
    qryTEXTOLINHA_6: TStringField;
    qryLINHA_7: TFloatField;
    qryTEXTOLINHA_7: TStringField;
    qryLINHA_8: TFloatField;
    qryTEXTOLINHA_8: TStringField;
    qryLINHA_9: TFloatField;
    qryTEXTOLINHA_9: TStringField;
    Bevel3: TBevel;
    qryIDDOCUMENTO: TFloatField;
    Label23: TLabel;
    Label24: TLabel;
    Label49: TLabel;
    Label25: TLabel;
    Label11: TLabel;
    Label27: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label17: TLabel;
    qryIDMODULO: TFloatField;
    Label16: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;

    // procedimentos definidos
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);

    procedure GravaLinha(iMensagem, iLinha: integer; sTexto: string);
    procedure ApagaLinha(iMensagem, iLinha: integer);

    function VerificaPreenchimento: boolean;
    function VerificaOcorrencia: boolean;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dsDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);


  private { Private declarations }
	iIndiceAnterior: integer;

  public { Public declarations }

  end;



var
  frmCadMsgBoleto: TfrmCadMsgBoleto;



implementation
{$R *.DFM}
Uses
  USistema, UMensErro, UDatabase, DBaseDados, uComunsImobiliario, uVerificaPreenchimento,
  FCadastroCS, uFuncoesImob;



procedure TfrmCadMsgBoleto.CmeCadastroEdit(Sender: TObject);
begin
   inherited;
   dbedDescricao.SetFocus;
end;



procedure TfrmCadMsgBoleto.CmeCadastroInsert(Sender: TObject);
begin
   inherited;
   dbedDescricao.SetFocus;
end;



procedure TfrmCadMsgBoleto.CmeCadastroConfirma(Sender: TObject);
var
   sLinha1, sLinha2, sLinha3  : string;
   sLinha4, sLinha5, sLinha6  : string;
   sLinha7, sLinha8, sLinha9  : string;
begin
   try

      if CmeCadastro.Operacao = opInserir then begin
         qryIDMSGBOLETO.asInteger := LeUltRegistro(nil, 'MSGBOLETO');
         qryIDMODULO.AsInteger    := Sistema.IdModulo;
      end;

      // grava sempre iddocumento NULO
      qryIDDOCUMENTO.Clear;

      sLinha1  := DBedtLinha1.Text;
      sLinha2  := DBedtLinha2.Text;
      sLinha3  := DBedtLinha3.Text;
      sLinha4  := DBedtLinha4.Text;
      sLinha5  := DBedtLinha5.Text;
      sLinha6  := DBedtLinha6.Text;
      sLinha7  := DBedtLinha7.Text;
      sLinha8  := DBedtLinha8.Text;
      sLinha9  := DBedtLinha9.Text;

      inherited;

      if CmeCadastro.Operacao in [opInserir, opAlterar] then begin

         // Grava o texto da linha na tabela detalhe / exclui o registro da tabela detalhe ---------
         if length(trim(sLinha1)) > 0 then begin
            GravaLinha(qryIDMSGBOLETO.asInteger, 1, sLinha1);
         end else begin
            ApagaLinha(qryIDMSGBOLETO.asInteger, 1);
         end;

         if length(trim(sLinha2)) > 0 then begin
            GravaLinha(qryIDMSGBOLETO.asInteger, 2, sLinha2);
         end else begin
            ApagaLinha(qryIDMSGBOLETO.asInteger, 2);
         end;

         if length(trim(sLinha3)) > 0 then begin
            GravaLinha(qryIDMSGBOLETO.asInteger, 3, sLinha3);
         end else begin
            ApagaLinha(qryIDMSGBOLETO.asInteger, 3);
         end;

         if length(trim(sLinha4)) > 0 then begin
            GravaLinha(qryIDMSGBOLETO.asInteger, 4, sLinha4);
         end else begin
            ApagaLinha(qryIDMSGBOLETO.asInteger, 4);
         end;

         if length(trim(sLinha5)) > 0 then begin
            GravaLinha(qryIDMSGBOLETO.asInteger, 5, sLinha5);
         end else begin
            ApagaLinha(qryIDMSGBOLETO.asInteger, 5);
         end;

         if length(trim(sLinha6)) > 0 then begin
            GravaLinha(qryIDMSGBOLETO.asInteger, 6, sLinha6);
         end else begin
            ApagaLinha(qryIDMSGBOLETO.asInteger, 6);
         end;

         if length(trim(sLinha7)) > 0 then begin
            GravaLinha(qryIDMSGBOLETO.asInteger, 7, sLinha7);
         end else begin
            ApagaLinha(qryIDMSGBOLETO.asInteger, 7);
         end;

         if length(trim(sLinha8)) > 0 then begin
            GravaLinha(qryIDMSGBOLETO.asInteger, 8, sLinha8);
         end else begin
            ApagaLinha(qryIDMSGBOLETO.asInteger, 8);
         end;

         if length(trim(sLinha9)) > 0 then begin
            GravaLinha(qryIDMSGBOLETO.asInteger, 9, sLinha9);
         end else begin
            ApagaLinha(qryIDMSGBOLETO.asInteger, 9);
         end;

      end;

   finally

   	// fecha e abre a query para re-ordenar a exibição no grid
   	qry.Close;
      qry.ParamByName('pIDMODULO').AsInteger := Sistema.IdModulo;
	   qry.Open;

   end;
end;

procedure TfrmCadMsgBoleto.GravaLinha(iMensagem, iLinha: integer; sTexto: string);
begin
   try
      with qryInsertLinha do begin
         LimpaParametros(qryInsertLinha);
         ParamByName('MSG').asInteger     := iMensagem;
         ParamByName('LINHA').asInteger   := iLinha;
         ParamByName('TEXTO').asString    := sTexto;
         ExecSQL;
      end;
   except
      with qryUpdateLinha do begin
         LimpaParametros(qryUpdateLinha);
         ParamByName('MSG').asInteger     := iMensagem;
         ParamByName('LINHA').asInteger   := iLinha;
         ParamByName('TEXTO').asString    := sTexto;
         ExecSQL;
      end;
   end;
end;

procedure TfrmCadMsgBoleto.ApagaLinha(iMensagem, iLinha: integer);
begin
   with qryDeleteLinha do begin
      LimpaParametros(qryDeleteLinha);
      ParamByName('MSG').asInteger     := iMensagem;
      ParamByName('LINHA').asInteger   := iLinha;
      ExecSQL;
   end;
end;



function TfrmCadMsgBoleto.VerificaPreenchimento: boolean;
begin
	Result := False;
	try

      if length(dbedDescricao.Text) = 0 then
         raise EValidacao.CreateVal('É necessário indicar a Descrição da Mensagem!', dbedDescricao);

   except

      on ev : EValidacao do begin
		   if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
			Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;
   Result := True;
end;



// funcão para verificação de duplicidade da descrição digitada
function TfrmCadMsgBoleto.VerificaOcorrencia: boolean;
begin
	with qryVerificaOcorrencia do begin
      LimpaParametros(qryVerificaOcorrencia);
      Params[0].asString := LowerCase(dbedDescricao.Text);
    	Open;
	end;

   Result := True;

   try

      // verifica a ocorrência na query e se não é o próprio
      if not(qryVerificaOcorrencia.IsEmpty) then begin
		   if qryVerificaOcorrencia.FieldByName('IDMSGBOLETO').asInteger <> iIndiceAnterior then begin
	         Result := False;
    	      raise EValidacao.CreateVal('Essa Característica já foi cadastrada!', dbedDescricao);
         end;
      end;

   except

      on ev : EValidacao do begin
         if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
      end;

   end;
end;

procedure TfrmCadMsgBoleto.bbtnConfirmarClick(Sender: TObject);
begin
   if VerificaPreenchimento then begin
      if VerificaOcorrencia then begin
			inherited;
      end;
   end;
end;

procedure TfrmCadMsgBoleto.dsDataChange(Sender: TObject; Field: TField);
begin
   inherited;
	iIndiceAnterior := qryIDMSGBOLETO.asInteger;
end;

procedure TfrmCadMsgBoleto.FormShow(Sender: TObject);
begin
   inherited;
	qry.Close;
   qry.ParamByName('pIDMODULO').AsInteger := Sistema.IdModulo;
   qry.Open;
end;

end.

{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : 101022
Responsável : Edilaine
Rotinas     : .dfm , dbchkAbateNeg
Data        : 03/05/2018
Descrição   : Se existir valor negativo a ser lançado na TMPDESC, valor deve
              ser abatido de um registro positivo.
--------------------------------------------------------------------------------
Pendência   : 27370
Responsável : Daniel Simões
Data        : 11/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FCadItemEmptmo;

interface

uses
   {$IFNDEF VERSAO0505} uCMTypes, {$ENDIF}
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FCadastroGridCSImob, CmEventosCadastro, ImgList, Db, Wwdatsrc,
   MontaSelect, DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn,
   StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid,
   ExtCtrls, Mask, DBCtrls;

type
   TfrmCadItemEmptmo = class(TfrmCadastroGridCSImob)
      DBedtDescricao: TDBEdit;
      Label1: TLabel;
      qryVerificaOcorrencia: TwwQuery;
      qryIDITEMEMPTMO: TFloatField;
      qryITEDESCRICAO: TStringField;
      qryVerificaOcorrenciaRubrica: TwwQuery;
      qryInsertRubrica: TwwQuery;
    dbchkAbateNeg: TDBCheckBox;

      procedure CmeCadastroInsert(Sender: TObject);
      procedure CmeCadastroEdit(Sender: TObject);
      procedure CmeCadastroConfirma(Sender: TObject);
      procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
      procedure qryAfterScroll(DataSet: TDataSet);
      procedure CmeCadastroDelete(Sender: TObject);


   private  // Private declarations

      iIndiceAnterior: int64;

      function VerificaPreenchimento: boolean;
      function VerificaOcorrencia: boolean;

      function GeraRubricas: boolean;


   public   // Public declarations

   end;



var
  frmCadItemEmptmo: TfrmCadItemEmptmo;



implementation
{$R *.DFM}
uses
   USistema, UMensErro, UDatabase, DBaseDados, UModulo, uFuncoesEmptmo, UVerificaPreenchimento,
   dEmptmo, FCadItemxTipoContrato;



function TfrmCadItemEmptmo.VerificaPreenchimento: boolean;
begin
	Result := False;
	try
      if qryIteDescricao.isNULL then
         raise EValidacao.CreateVal('É necessário indicar a Descrição do Item!', DBedtDescricao);

   except
      on ev : EValidacao do
      begin
		   if ev.Show then MsgDlg(ev.message, 'Empréstimo', mtWarning, [mbOk], 0);
			Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;
   end;
   Result := True;
end;



// funcão para verificação de duplicidade da descrição digitada
function TfrmCadItemEmptmo.VerificaOcorrencia: boolean;
begin
	with qryVerificaOcorrencia do begin
      LimpaParametros(qryVerificaOcorrencia);
      Params[0].asString := LowerCase(DBedtDescricao.Text);
    	Open;
	end;

   Result := True;

   try

      // verifica a ocorrência na query e se não é o próprio
      if not(qryVerificaOcorrencia.IsEmpty) then begin
		   if qryVerificaOcorrencia.FieldByName('IDITEMEMPTMO').asInteger <> iIndiceAnterior then begin
	         Result := False;
    	      raise EValidacao.CreateVal('Esse Item já foi cadastrada!', DBedtDescricao);
         end;
      end;

   except

      on ev : EValidacao do begin
         if ev.Show then MsgDlg(ev.message, 'Empréstimo', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
      end;

   end;
end;



function TfrmCadItemEmptmo.GeraRubricas: boolean;
var
   iRubrica : Int64;
   iTipo, i : Integer;
   sTipo    : String;
   sPrefixo : String;
   sRubrica : String;
begin
	Result := False;

   (* verifica nos parâmetros do Sistema se é para gerar automaticamente as rubricas na ProvDesc;
      se não conseguir abrir os parâmetros, já sai
      verifica tbém se o usuário deseja gerar as rubricas; se não, sai *)

   if not(ParametrosSistema) then Exit;
   if ( (dtmEmptmo.qryParamEmptmoFLGGERARUBRICA.isNULL) or (dtmEmptmo.qryParamEmptmoFLGGERARUBRICA.AsInteger = 0) ) then Exit;
   if MsgDlg('Deseja gerar as Rubricas para Folha?', 'Empréstimo', mtConfirmation, [mbYes, mbNo], 0) = mrNo then Exit;


   (* Geração das Rubricas ---------------------------------------------------------------------- *)

    for i := 1 to 6 do begin

      iRubrica := LeUltRegistro(nil, 'PROVDESC');

      (* prepara o prefixo de acordo com o Tipo de Rubrica *)
      case i of
         1, 2: sPrefixo := '[Normal] - ';
         3, 4: sPrefixo := '[Atraso] - ';
            5: sPrefixo := '[Devolução] - ';
            6: sPrefixo := '[Saldo] - ';
      end;

      sRubrica := sPrefixo + qryITEDESCRICAO.AsString;

      (* define o "sinal" de acordo com o Tipo de Rubrica *)
      case i of
         1, 3, 5: iTipo := 0; (* Provento: Natureza = Pagar *)
            2, 4: iTipo := 1; (* Desconto: Natureza = Receber *)
               6: iTipo := 2; (* Informativo (Saldo, etc.) *)
      end;

      (* define o flgAtrasoDevol ('N', 'A', 'D') de acordo com o Tipo de Rubrica *)
      case i of
         1, 2: sTipo := 'N'; (* Normal *)
         3, 4: sTipo := 'A'; (* Atraso *)
            5: sTipo := 'D'; (* Devolução *)
            6: stipo := '';  (* ??? *)
      end;

		try
         (* insere, efetivamente *)
         with qryInsertRubrica do begin
            LimpaParametros(qryInsertRubrica);
            ParamByName('PIDPROVENTO').AsInteger		:= iRubrica;
            ParamByName('PFLGDESCONTO').AsInteger		:= iTipo;
            ParamByName('PDESCRICAO').AsString			:= sRubrica;
            ParamByName('PFLGATRASODEVOL').AsString	:= sTipo;
            ExecSQL;
         end;

      except
      end;

   end;(* for *)

	Result := True;
end;



procedure TfrmCadItemEmptmo.CmeCadastroInsert(Sender: TObject);
begin
   inherited;
   if DBedtDescricao.CanFocus then DBedtDescricao.SetFocus;     
end;



procedure TfrmCadItemEmptmo.CmeCadastroEdit(Sender: TObject);
begin
   inherited;
   if DBedtDescricao.CanFocus then DBedtDescricao.SetFocus;
end;



procedure TfrmCadItemEmptmo.CmeCadastroConfirma(Sender: TObject);
var
   sMsg		: String;
   bInsert	: Boolean;
begin
   try

      try
         bInsert := False;

         if CmeCadastro.Operacao = opInserir then
         begin
            qryIDITEMEMPTMO.asInteger := LeUltRegistro(nil, 'ITEMEMPTMO');
            bInsert := True;
         end;

         inherited;

      except
         Raise;
         Repaint;

         Exit;
      end;

      // -------------------------------------------------------------------------------------------

      if bInsert then
      begin
         if ( (ParametrosSistema) and (dtmEmptmo.qryParamEmptmoFLGGERARUBRICA.AsInteger = 1) ) then begin
            if GeraRubricas then
            begin
					sMsg	:= 'Rubricas criadas. ';
	            MsgDlg(sMsg, 'Empréstimo', mtInformation, [mbOk], 0);
            end else begin
					sMsg	:= 'Houve ERRO durante o processo de criação das Rubricas. ' +
               			'Algumas rubricas podem não ter sido criadas. Favor verificar. ';
	            MsgDlg(sMsg, 'Empréstimo', mtError, [mbOk], 0);
            end;
            Repaint;
         end;
      end;

   finally
      (* fecha e abre a query para re-ordenar a exibição no grid *)
      qry.Close;
      qry.Open;
   end;
end;



procedure TfrmCadItemEmptmo.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := ( VerificaPreenchimento and VerificaOcorrencia );

   if Accept then
   begin
      case CmeCadastro.Operacao of
         opInserir:  Accept := Sistema.GravaLogOperacoes('Cadastro de Item de Empréstimo. Inserção.');
         opAlterar:  Accept := Sistema.GravaLogOperacoes('Cadastro de Item de Empréstimo. Alteração.');
         opApagar:   Accept := Sistema.GravaLogOperacoes('Cadastro de Item de Empréstimo. Exclusão.');
      end;
   end;

   if not(Accept) then Raise Exception.Create('Falha na gravação do Log da operação.');
end;



procedure TfrmCadItemEmptmo.qryAfterScroll(DataSet: TDataSet);
begin
   inherited;
	iIndiceAnterior := qryIDItemEmptmo.asInteger;
end;



procedure TfrmCadItemEmptmo.CmeCadastroDelete(Sender: TObject);
begin
   if qryIDITEMEMPTMO.AsInteger > 0 then
   begin
      inherited;
   end
   else
   begin
      MsgDlg('Este item não pode ser excluído.', 'Empréstimo', mtWarning, [mbOk], 0);
   end;
end;



end.

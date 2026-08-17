unit FCadOutroDado;

//	------------------------------------------------------------------------------------------------
//
//	   Cadastro de Tipos de Dados Complementares
//
//	Autor          :  André Pontes
//	Data de Início :	18/03/2000
//	Data de Término:	18/03/2000
//
//	Modificações	:  14/11/2000  1) Retirada do pnlControles.SendToBack no FormShow (passou para
//                                  o ancestral
//
// -------------------------------------------------------------------------------------------------



interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, Mask, DBCtrls, FCadastroGridCSImob,
  CmEventosCadastro, ImgList,
  {$IFNDEF VERSAO0505} uCMTypes {$ENDIF};

type
  TfrmCadOutroDado = class(TFrmCadastroGridCSImob)
    qryVerificaOcorrencia: TwwQuery;
    Label1: TLabel;
    dbedDescricao: TDBEdit;
    qryIDOUTRODADO: TFloatField;
    qryODODESCRICAO: TStringField;
    qryVerificaOcorrenciaIDOUTRODADO: TFloatField;
    qryVerificaOcorrenciaODODESCRICAO: TStringField;

    // procedimentos definidos
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);

    function VerificaPreenchimento: boolean;
    function VerificaOcorrencia: boolean;

    // outros procedimentos
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dsDataChange(Sender: TObject; Field: TField);



  private { Private declarations }
	iIndiceAnterior: integer;

  public { Public declarations }

  end;



var
  frmCadOutroDado: TfrmCadOutroDado;



implementation
{$R *.DFM}
Uses
  USistema, UMensErro, UDatabase, DBaseDados, UModulo, UVerificaPreenchimento, FCadastroCS, uFuncoesImob;



procedure TfrmCadOutroDado.CmeCadastroEdit(Sender: TObject);
begin
   inherited;
   dbedDescricao.SetFocus;
end;



procedure TfrmCadOutroDado.CmeCadastroInsert(Sender: TObject);
begin
   inherited;
   dbedDescricao.SetFocus;
end;



procedure TfrmCadOutroDado.CmeCadastroConfirma(Sender: TObject);
begin
   if CmeCadastro.Operacao = opInserir then qryIDOUTRODADO.asInteger := LeUltRegistro(nil, 'OUTRODADO');

	inherited;

	// fecha e abre a query para re-ordenar a exibição no grid
	qry.Close;
	qry.Open;
end;



function TfrmCadOutroDado.VerificaPreenchimento: boolean;
begin
	Result := False;
	try

      if length(dbedDescricao.Text) = 0 then
         raise EValidacao.CreateVal('É necessário indicar o Tipo de Dado Complementar!', dbedDescricao);

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
function TfrmCadOutroDado.VerificaOcorrencia: boolean;
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
		   if qryVerificaOcorrenciaIDOUTRODADO.asInteger <> iIndiceAnterior then begin
	         Result := False;
    	      raise EValidacao.CreateVal('Esse Tipo de Dado já foi cadastrada!', dbedDescricao);
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



procedure TfrmCadOutroDado.bbtnConfirmarClick(Sender: TObject);
begin
   if VerificaPreenchimento then begin
      if VerificaOcorrencia then begin
			inherited;
      end;
   end;
end;



procedure TfrmCadOutroDado.dsDataChange(Sender: TObject; Field: TField);
begin
   inherited;
	iIndiceAnterior := qryIDOUTRODADO.asInteger;
end;



end.

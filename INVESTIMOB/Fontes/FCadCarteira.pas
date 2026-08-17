unit FCadCarteira;

//	------------------------------------------------------------------------------------------------
//
//	   Cadastro de Carteiras de Investimento
//
//	Autor          :  André Pontes
//	Data de Início :	11/10/1999
//	Data de Término:	11/10/1999
//
//	Modificações	:  14/11/2000  1) Retirada do pnlControles.SendToBack no FormShow (passou para
//                                  o ancestral
//
// -------------------------------------------------------------------------------------------------



interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  wwdblook, StdCtrls, Mask, wwdbedit, IvDictio, IvMulti,
  IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls,
  MAHlpBtn, Buttons, TB97Tlbr, TB97, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls,
  FCadastroGridCSImob, CmEventosCadastro, ImgList;

type
  TfrmCadCarteira = class(TfrmCadastroGridCSImob)
    qryVerificaOcorrencia: TwwQuery;
    Label2: TLabel;
    Label1: TLabel;
    DBedtDescricao: TwwDBEdit;
    DBcboGestor: TwwDBLookupCombo;
    qryLookGestor: TwwQuery;
    qryLookGestorIDGESTORCARTEIRA: TFloatField;
    qryLookGestorIDPESSOA: TFloatField;
    qryLookGestorNOME: TStringField;
    qryIDCARTEIRAINVEST: TFloatField;
    qryDESCCARTINVEST: TStringField;
    qryIDGESTORCARTEIRA: TFloatField;
    qryVerificaOcorrenciaIDCARTEIRAINVEST: TFloatField;
    qryVerificaOcorrenciaDESCCARTINVEST: TStringField;

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
    iIndiceAnterior : integer;

  public { Public declarations }

  end;



var
  frmCadCarteira: TfrmCadCarteira;



implementation
{$R *.DFM}
uses
   USistema, UMensErro, UDatabase, DBaseDados, UModulo, uComunsImobiliario, uVerificaPreenchimento, FCadastroCS, uFuncoesImob;



procedure TfrmCadCarteira.CmeCadastroEdit(Sender: TObject);
begin
   inherited;
   if DBedtDescricao.CanFocus then DBedtDescricao.SetFocus;
end;



procedure TfrmCadCarteira.CmeCadastroInsert(Sender: TObject);
begin
   inherited;
   if DBedtDescricao.CanFocus then DBedtDescricao.SetFocus;
end;



procedure TfrmCadCarteira.CmeCadastroConfirma(Sender: TObject);
begin
   if CmeCadastro.Operacao = opInserir then qryIDCARTEIRAINVEST.asInteger := LeUltRegistro(nil, 'CARTEIRAINVEST');

   inherited;

	// fecha e abre a query para re-ordenar a exibição na grid
   qry.Close;
   qry.Open;
end;



function TfrmCadCarteira.VerificaPreenchimento: boolean;
begin
	Result := False;

	try

      if ( (length(trim(DBedtDescricao.Text)) = 0) or (qryDESCCARTINVEST.isNULL) ) then
         raise EValidacao.CreateVal('É necessário indicar o Nome da Carteira!', DBedtDescricao);

      if ( (length(trim(DBcboGestor.Text)) = 0) or (qryIDGESTORCARTEIRA.isNULL) ) then
         raise EValidacao.CreateVal('É necessário indicar o Gestor da Carteira!', DBcboGestor);

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
function TfrmCadCarteira.VerificaOcorrencia: boolean;
begin
   Result := True;

   try

      with qryVerificaOcorrencia do begin
         LimpaParametros(qryVerificaOcorrencia);
         ParamByName('DESCRICAO').asString := LowerCase(DBedtDescricao.Text);
         Open;
      end;

      // verifica a ocorrência na query e se não é o próprio
      if not(qryVerificaOcorrencia.IsEmpty) then begin
		   if qryVerificaOcorrenciaIDCARTEIRAINVEST.asInteger <> iIndiceAnterior then begin
	         Result := False;
    	      raise EValidacao.CreateVal('Essa Carteira já foi cadastrada!', DBedtDescricao);
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



procedure TfrmCadCarteira.bbtnConfirmarClick(Sender: TObject);
begin
   if VerificaPreenchimento then begin
      if VerificaOcorrencia then begin
			inherited;
      end;
   end;
end;



procedure TfrmCadCarteira.dsDataChange(Sender: TObject; Field: TField);
begin
   inherited;
	iIndiceAnterior := qryIDCARTEIRAINVEST.asInteger;
end;



end.

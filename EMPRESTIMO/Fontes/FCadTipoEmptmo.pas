{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : 27370
Responsável : Daniel Simões
Data        : 11/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
Rotina    : wwDBSpinEdit1 e speNumCtr
Data      : 21/01/2007
Autor     :
Pendência : 26916
Descrição : Alterada ordem dos campos para mostrar Nº máximo de inscrições por
            participante antes do Nº máximo de contratos por participante,
            compatibilizando com a tela de Tipos de Contrato de Empréstimo
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FCadTipoEmptmo;

interface

uses
   {$IFNDEF VERSAO0505} uCMTypes, {$ENDIF}
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FCadastroGridCSImob, CmEventosCadastro, ImgList, Db, Wwdatsrc,
   MontaSelect, DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn,
   StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid,
   ExtCtrls, wwdbedit, Wwdbspin, Mask, DBCtrls, mRegraDB;

type
  TfrmCadTipoEmptmo = class(TfrmCadastroGridCSImob)
    Label1: TLabel;
    DBedtDescricao: TDBEdit;
    GroupBox1: TGroupBox;
    speNumCtr: TwwDBSpinEdit;
    wwDBSpinEdit1: TwwDBSpinEdit;
    wwDBSpinEdit2: TwwDBSpinEdit;
    molRegraDB1: TmolRegraDB;
    molRegraDB2: TmolRegraDB;
    molRegraDB3: TmolRegraDB;
    wwDBSpinEdit3: TwwDBSpinEdit;
    wwDBSpinEdit4: TwwDBSpinEdit;
    Bevel1: TBevel;
    Label7: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    qryIDTIPOEMPTMO: TFloatField;
    qryIDEMPRESAPROP: TFloatField;
    qryDESCTIPOEMPTMO: TStringField;
    qryIDREGRAELEG: TFloatField;
    qryIDREGRAMARGEM: TFloatField;
    qryIDREGRARESERVA: TFloatField;
    qryTEPMAXCONTRATO: TFloatField;
    qryTEPMAXINSCR: TFloatField;
    qryTEPMAXPARC: TFloatField;
    qryTEPMINPARC: TFloatField;
    qryTEPMINQUIT: TFloatField;
    qryNOMEREGRAELEG: TStringField;
    qryNOMEREGRAMARGEM: TStringField;
    qryNOMEREGRARESERVA: TStringField;
    qryVerificaOcorrencia: TwwQuery;
    Label2: TLabel;
    wwDBSpinEdit5: TwwDBSpinEdit;
    qryTEPMINRENOVA: TFloatField;

    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);

    procedure qryAfterScroll(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);


  private { Private declarations }

    iIndiceAnterior : int64;

    procedure PreencheDefaults;
    function VerificaOcorrencia: boolean;
    function VerificaPreenchimento: boolean;


  public { Public declarations }


  end;



var
  frmCadTipoEmptmo: TfrmCadTipoEmptmo;



implementation
{$R *.DFM}
uses
   USistema, UMensErro, UDatabase, DBaseDados, UModulo, uFuncoesEmptmo,
   UVerificaPreenchimento;



procedure TfrmCadTipoEmptmo.PreencheDefaults;
begin
   if qryTEPMAXCONTRATO.IsNull then qryTEPMAXCONTRATO.AsInteger   := 1;
   if qryTEPMAXINSCR.IsNull then    qryTEPMAXINSCR.AsInteger      := 1;
   if qryTEPMINPARC.IsNull then     qryTEPMINPARC.AsInteger       := 1;
   if qryTEPMAXPARC.IsNull then     qryTEPMAXPARC.AsInteger       := 1;
   if qryTEPMINQUIT.IsNull then     qryTEPMINQUIT.AsInteger       := 0;
end;



function TfrmCadTipoEmptmo.VerificaPreenchimento: boolean;
begin
	Result := False;

	try

      if qryDESCTIPOEMPTMO.isNULL then
         raise EValidacao.CreateVal('É necessário indicar a Descrição do Tipo de Empréstimo!', DBedtDescricao);

   except

      on ev : EValidacao do begin
		   if ev.Show then MsgDlg(ev.message, 'Empréstimo', mtWarning, [mbOk], 0);
			Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;

   Result := True;
end;



// funcão para verificação de duplicidade da descrição digitada
function TfrmCadTipoEmptmo.VerificaOcorrencia: boolean;
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
		   if qryVerificaOcorrencia.FieldByName('IDTIPOEMPTMO').asInteger <> iIndiceAnterior then begin
	         Result := False;
    	      raise EValidacao.CreateVal('Esse Tipo de Empréstimo já foi cadastrado!', DBedtDescricao);
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



procedure TfrmCadTipoEmptmo.CmeCadastroConfirma(Sender: TObject);
begin
   try

      // grava a empresaprop
      if qry.State in [dsInsert, dsEdit] then qryIDEMPRESAPROP.AsInteger := Sistema.IDEmpresa;

      // pega o próximo id
      if qry.State = dsInsert then qryIDTIPOEMPTMO.AsInteger := LeUltRegistro(nil, 'TIPOEMPTMO');

      inherited;

   except
      Raise;
      Repaint;
   end;
end;



procedure TfrmCadTipoEmptmo.CmeCadastroEdit(Sender: TObject);
begin
   inherited;

   PreencheDefaults;
   if DBedtDescricao.CanFocus then DBedtDescricao.SetFocus;
end;



procedure TfrmCadTipoEmptmo.CmeCadastroInsert(Sender: TObject);
begin
   inherited;

   PreencheDefaults;
   if DBedtDescricao.CanFocus then DBedtDescricao.SetFocus;
end;



procedure TfrmCadTipoEmptmo.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := ( VerificaPreenchimento and VerificaOcorrencia );

   if Accept then
   begin
      case CmeCadastro.Operacao of
         opInserir:  Accept := Sistema.GravaLogOperacoes('Cadastro de Tipo de Empréstimo. Inserção.');
         opAlterar:  Accept := Sistema.GravaLogOperacoes('Cadastro de Tipo de Empréstimo. Alteração.');
         opApagar:   Accept := Sistema.GravaLogOperacoes('Cadastro de Tipo de Empréstimo. Exclusão.');
      end;
   end;

   if not(Accept) then Raise Exception.Create('Falha na gravação do Log da operação.');
end;



procedure TfrmCadTipoEmptmo.qryAfterScroll(DataSet: TDataSet);
begin
   inherited;
	iIndiceAnterior := qryIDTIPOEMPTMO.asInteger;
end;



procedure TfrmCadTipoEmptmo.FormShow(Sender: TObject);
begin
   inherited;

   // abre a query principal
   with qry do begin
      LimpaParametros(qry);
      ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.IDEmpresa;
      Open;
      if not IsEmpty then begin
         CmeCadastro.Operacao := opIdle;
         CmeCadastroAtualizaBotoes(Sender);
      end;
   end;
end;



end.

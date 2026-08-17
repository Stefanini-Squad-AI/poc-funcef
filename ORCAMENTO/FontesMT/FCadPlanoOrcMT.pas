// Alterações:
{ --------------------------------------------------------------------------------------------------
Rotina......: Todo o Formulário
Nº SOL......: 159242/6041
Nº KINTANA..: 1385831
Data........: 31/06/2011
Responsável.: Ricardo de Freitas Araújo
Descrição...: Adicionado campo Ano
----------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 15/12/2003
Autor     : André Pontes
Pendencia : -
Descrição : Criado campo para a máscara dos grupos orçamentários
---------------------------------------------------------------------------------------------------}

{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Davi Ramos                      }
{ Atualizado Em: Julho/2002                             }
{                                                       }
{*******************************************************}
unit FCadPlanoOrcMT;

interface

uses     
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FCadastroMT, Grids, Wwdbigrd, Wwdbgrid, MontaSelect, Db, DBClient,
   uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc, IvDictio,
   IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97,
   ExtCtrls, uCtrlPlanoOrcamen, Mask, wwdbedit, uCMTypes, uCmSqlParams;

type
   TfrmCadPlanoOrcMT = class(TFrmCadastroMT)
      dbedNomePlanoOrcamentario: TwwDBEdit;
      DBedtMascaraGrupo: TwwDBEdit;
      CMSqlParams1: TCMSqlParams;
      Label1: TLabel;
      Label2: TLabel;
    Label3: TLabel;
    wwDBEdit1: TwwDBEdit;

      procedure FormCreate(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure CmeCadastroInsert(Sender: TObject);
      procedure CmeCadastroEdit(Sender: TObject);
      procedure CmeCadastroFind(Sender: TObject);
      procedure CmeCadastroAfterConfirma(Sender: TObject);
      procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
      procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
      procedure CmeCadastroAbortConfirma(sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
      procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
      procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);


   private  // Private declarations

      CtrlPlanoOrcamen : TCtrlPlanoOrcamen;

      function  VerificaPreenchimento: Boolean;


   public   // Public declarations

   end;



var
   frmCadPlanoOrcMT: TfrmCadPlanoOrcMT;



implementation
{$R *.DFM}
uses
   uSistema, uMensErro, dBaseDados, uVerificaPreenchimento;




function TfrmCadPlanoOrcMT.VerificaPreenchimento: Boolean;
begin
	Result := False;

	try

      if length(trim(dbedNomePlanoOrcamentario.Text)) = 0 then
         raise EValidacao.CreateVal('Obrigatório preencher a Descrição!', dbedNomePlanoOrcamentario);

      if length(trim(DBedtMascaraGrupo.Text)) = 0 then
         raise EValidacao.CreateVal('Obrigatório preencher a Máscara dos Grupos Orçamentários!', DBedtMascaraGrupo);

   except

      on ev : EValidacao do
      begin
		   if ev.Show then MsgDlg(ev.message, 'Orçamento', mtWarning, [mbOk], 0);
			Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;

   Result := True;
end;



procedure TfrmCadPlanoOrcMT.FormCreate(Sender: TObject);
begin
   inherited;

   CtrlPlanoOrcamen := TCtrlPlanoOrcamen.Create;

   CtrlPlanoOrcamen.Initialize(DtmBaseDados.dbBaseDados, True,
                                Sistema.ConnectionType,   Sistema.ConnectionSide,
                                Sistema.AppRemoteServer,  True, nil, nil, False);


   // Atribui os ClientDataSets local a ser persistido pelo objeto de negócios
   CtrlPlanoOrcamen.CdsPlanoOrcamen := cds;

   cds.Data := CtrlPlanoOrcamen.Procurar(-1);
end;



procedure TfrmCadPlanoOrcMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   CtrlPlanoOrcamen.Free;
end;



procedure TfrmCadPlanoOrcMT.CmeCadastroInsert(Sender: TObject);
begin
   inherited;
   dbedNomePlanoOrcamentario.SetFocus;
end;



procedure TfrmCadPlanoOrcMT.CmeCadastroEdit(Sender: TObject);
begin
   inherited;
   dbedNomePlanoOrcamentario.SetFocus;
end;



procedure TfrmCadPlanoOrcMT.CmeCadastroFind(Sender: TObject);
begin
   inherited;

   if MontaSelect.RetornouValor then
   begin
      Repaint;
      cds.Data := CtrlPlanoOrcamen.Procurar(StrtoFloat(MontaSelect.ValoresChave[ 0 ]));
   end;
end;



procedure TfrmCadPlanoOrcMT.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := CtrlPlanoOrcamen.AplicaOperacaoPlanoOrcamen;
end;



procedure TfrmCadPlanoOrcMT.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := CtrlPlanoOrcamen.AplicaOperacaoPlanoOrcamen;
end;



procedure TfrmCadPlanoOrcMT.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := CtrlPlanoOrcamen.AplicaOperacaoPlanoOrcamen;
end;



procedure TfrmCadPlanoOrcMT.CmeCadastroAbortConfirma(sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
begin
   inherited;

   if OrigemAbortConfirma <> OaBeforeConfirma then
   begin
      MsgDlg('Ocorreu o seguinte erro : '+ CtrlPlanoOrcamen.MessageInfo, 'Aviso', mtError,[mbOK],0);
      Repaint;
   end;
end;



procedure TfrmCadPlanoOrcMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
   inherited;
   cds.Data := CtrlPlanoOrcamen.Procurar(cds.FieldByName('IDPLANOORCAMEN').AsFloat);
end;




procedure TfrmCadPlanoOrcMT.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
   Accept := VerificaPreenchimento;
   inherited;
end;



end.

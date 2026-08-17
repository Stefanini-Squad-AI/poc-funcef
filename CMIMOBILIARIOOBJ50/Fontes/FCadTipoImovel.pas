unit FCadTipoImovel;

//	-------------------------------------------------------------------------------------------------
//
//	   Cadastro de Tipos de Imóvel
//
//	Autor          :  André Pontes
//	Data de Início :	28/06/1999
//	Data de Término:	28/06/1999
//
//	Modificações	:  02/02/2000  1) Novos campos relativos aos alteradores a utilizar para multa,
//                                  juros e correção monetária
//                   04/02/2000  2) Mudança do nome da Unit e do Form para CadTipoImovel
//                   13/06/2000  3) Inclusão dos Grupos do Ativo Fixo (p/ transferência)
//                   14/11/2000  4) Retirada do pnlControles.SendToBack no FormShow (passou para
//                                  o ancestral
//                   27/04/2001  5) Novos "grupos" para transferência, redesenho do form
//                   05/07/2001  6) Novo grupo: "Móveis e Utensílios"
//                               7) Redesenho do form em função do tamanho
//
// -------------------------------------------------------------------------------------------------



interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, Mask, wwdbedit, wwdblook,
  FCadastroGridCSImob, CmEventosCadastro,
  {$IFNDEF VERSAO0505} uCMTypes, {$ENDIF}
  ImgList;

type
  TfrmCadTipoImovel = class(TfrmCadastroGridCSImob)
    updTipoTitulo: TUpdateSQL;
    qryTipoTitulo: TwwQuery;
    qryCODTIPIMOVEL: TStringField;
    qryTipoTituloIDTIPOINVEST: TFloatField;
    qryTipoTituloCODTIPTITULO: TStringField;
    qryVerificaOcorrencia: TwwQuery;
    qryVerificaOcorrenciaCODTIPIMOVEL: TStringField;
    qryDeleteTitulo: TwwQuery;
    qryDESCTIPOIMOVEL: TStringField;
    qryVerificaOcorrenciaDESCTIPOIMOVEL: TStringField;
    Label2: TLabel;
    Label1: TLabel;
    dbedDescricao: TwwDBEdit;
    DBedtCodigo: TwwDBEdit;
    GroupBox1: TGroupBox;
    qryCODALTMULTA: TFloatField;
    qryCODALTJUROS: TFloatField;
    qryCODALTCORRMON: TFloatField;
    GroupBox2: TGroupBox;
    qryIDGRUPOTERRENO: TFloatField;
    qryIDGRUPOEDIFICACAO: TFloatField;
    qryIDGRUPOINST: TFloatField;
    qryIDGRUPOELET: TFloatField;
    ToolbarButton971: TToolbarButton97;
    qryCODALTCOMISSAO: TFloatField;
    qryIDGRUPOAR: TFloatField;
    qryIDGRUPOUTILITARIO: TFloatField;
    qryIDGRUPOMAQUINA: TFloatField;
    qryIDGRUPOVEICULO: TFloatField;
    Bevel3: TBevel;
    DBcboAltMulta: TwwDBLookupCombo;
    Label4: TLabel;
    DBcboAltCorrMon: TwwDBLookupCombo;
    Label5: TLabel;
    Label10: TLabel;
    DBcboAlteradorComissao: TwwDBLookupCombo;
    DBcboAltJuros: TwwDBLookupCombo;
    Label3: TLabel;
    Bevel1: TBevel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label6: TLabel;
    Bevel2: TBevel;
    DBcboGrupoEdif: TwwDBLookupCombo;
    DBcboGrupoTerr: TwwDBLookupCombo;
    DBcboGrupoInst: TwwDBLookupCombo;
    DBcboGrupoElet: TwwDBLookupCombo;
    DBcboGrupoVeiculo: TwwDBLookupCombo;
    DBcboGrupoUtilitario: TwwDBLookupCombo;
    DBcboGrupoMaquina: TwwDBLookupCombo;
    DBcboGrupoAr: TwwDBLookupCombo;
    Label15: TLabel;
    Bevel4: TBevel;
    Label16: TLabel;
    Label17: TLabel;
    wwDBLookupCombo1: TwwDBLookupCombo;
    qryIDGRUPOMOVEL: TFloatField;

    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dsDataChange(Sender: TObject; Field: TField);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);



    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroDelete(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
  private { Private declarations }
    sCodigoAnterior: string;


    procedure FazerRefresh; override;

    function VerificaPreenchimento: boolean;
    function VerificaOcorrencia: boolean;

  public { Public declarations }

  end;



var
  frmCadTipoImovel: TfrmCadTipoImovel;


implementation
{$R *.DFM}
uses
   USistema, UMensErro, UDatabase, DBaseDados, UModulo, uComunsImobiliario, uVerificaPreenchimento,
   dLookImobiliario, fCadastroCS, uFuncoesImob;



procedure TfrmCadTipoImovel.CmeCadastroInsert(Sender: TObject);
begin
   with dtmLookImobiliario.qryLookAlteradorXTipoImo do begin
      LimpaParametros(dtmLookImobiliario.qryLookAlteradorXTipoImo);
      ParamByName('PCODTIPIMOVEL').asString     := qryCODTIPIMOVEL.AsString;
      ParamByName('PIDEMPRESAPROP').asInteger   := Sistema.idEmpresa;
      Open;
   end;

   inherited;

   DBedtCodigo.ReadOnly := False;
   DBedtCodigo.SetFocus;
end;



procedure TfrmCadTipoImovel.CmeCadastroEdit(Sender: TObject);
begin
   with dtmLookImobiliario.qryLookAlteradorXTipoImo do begin
      LimpaParametros(dtmLookImobiliario.qryLookAlteradorXTipoImo);
      ParamByName('PCODTIPIMOVEL').asString     := qryCODTIPIMOVEL.AsString;
      ParamByName('PIDEMPRESAPROP').asInteger   := Sistema.idEmpresa;
      Open;
   end;

   inherited;

   DBedtCodigo.ReadOnly := True;
   dbedDescricao.SetFocus;
end;



procedure TfrmCadTipoImovel.CmeCadastroDelete(Sender: TObject);
begin
   Repaint;

   with qryDeleteTitulo do begin
      LimpaParametros(qryDeleteTitulo);
      Params[0].asString := LowerCase(sCodigoAnterior);
      ExecSQL;
   end;

   CmeCadastro.Confirma(Self);
end;



procedure TfrmCadTipoImovel.CmeCadastroConfirma(Sender: TObject);
begin
   try
      try

         if CmeCadastro.Operacao = opInserir then begin
            with qryTipoTitulo do begin
               Open;
               Insert;
               FieldByName('IDTIPOINVEST').asInteger  := 3;
               FieldByName('CODTIPTITULO').asString   := qry.FieldByName('CODTIPIMOVEL').asString;
               AplicaAlteracoes([qryTipoTitulo]);
            end;
         end;

         inherited;

      except
         Raise;
         Repaint;
      end;

   finally
      qryTipoTitulo.Close;
   	// fecha e abre a query para re-ordenar a exibição no grid
	   qry.Close;
   	qry.Open;
   end;
end;



procedure TfrmCadTipoImovel.FazerRefresh;
begin
   with dtmLookImobiliario.qryLookAlteradorXTipoImo do begin
      LimpaParametros(dtmLookImobiliario.qryLookAlteradorXTipoImo);
      ParamByName('PCODTIPIMOVEL').asString     := qryCODTIPIMOVEL.AsString;
      ParamByName('PIDEMPRESAPROP').asInteger   := Sistema.idEmpresa;
      Open;
   end;

   dtmLookImobiliario.qryLookGrupo.Close;
   dtmLookImobiliario.qryLookGrupo.Open;
end;



function TfrmCadTipoImovel.VerificaPreenchimento: boolean;
begin
	Result := False;
	try

      if length(DBedtCodigo.Text) = 0 then
         raise EValidacao.CreateVal('É necessário indicar o Código do Tipo do Imóvel!', DBedtCodigo);

      if length(dbedDescricao.Text) = 0 then
         raise EValidacao.CreateVal('É necessário indicar o Tipo do Imóvel!', dbedDescricao);

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
function TfrmCadTipoImovel.VerificaOcorrencia: boolean;
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
		   if qryVerificaOcorrencia.FieldByName('CODTIPIMOVEL').asString <> sCodigoAnterior then begin
	         Result := False;
    	      raise EValidacao.CreateVal('Esse Tipo de Imóvel já foi cadastrado!', dbedDescricao);
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



procedure TfrmCadTipoImovel.bbtnConfirmarClick(Sender: TObject);
begin
   if VerificaPreenchimento then begin
      if VerificaOcorrencia then inherited;
   end;
end;



procedure TfrmCadTipoImovel.FormShow(Sender: TObject);
begin
	inherited;
   dtmLookImobiliario.qryLookGrupo.Open;
end;



procedure TfrmCadTipoImovel.dsDataChange(Sender: TObject; Field: TField);
begin
	inherited;
	sCodigoAnterior := qryCODTIPIMOVEL.asString;
end;



procedure TfrmCadTipoImovel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   dtmLookImobiliario.qryLookAlteradorXTipoImo.Close;
   dtmLookImobiliario.qryLookGrupo.Close;

   inherited;
end;



end.

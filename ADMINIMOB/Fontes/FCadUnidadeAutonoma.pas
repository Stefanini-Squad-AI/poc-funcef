unit FCadUnidadeAutonoma;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, wwdblook, StdCtrls, Mask, DBCtrls, ExtCtrls, ComCtrls,
  IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc,
  Wwquery, TB97Ctls, MAHlpBtn, Buttons, TB97Tlbr, TB97, fcButton, fcImgBtn,
  fcShapeBtn, Grids, Wwdbigrd, Wwdbgrid, Wwdbgrd2, FCadastroCSImob,
  CmEventosCadastro, ImgList
  {$IFNDEF VERSAO0505}, uCMTypes {$ENDIF};

type
  TfrmCadUnidadeAutonoma = class(TfrmCadastroCSImob)
    pgctrlDetalhe: TPageControl;
    tbsGeral: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Bevel2: TBevel;
    Label6: TLabel;
    Label7: TLabel;
    DBedtNome: TDBEdit;
    DBedtMatricula: TDBEdit;
    DBedtRateio: TDBEdit;
    DBedtImovel: TDBEdit;
    btnBuscaImovel: TBitBtn;
    DBcboMarca: TwwDBLookupCombo;
    tbsDet: TTabSheet;
    tbsIndicadores: TTabSheet;
    DBgrdIndicador: TwwDBGrid2;
    btnPorData: TfcShapeBtn;
    btnPorTipo: TfcShapeBtn;
    DBgrdOutroDadoXImovel: TwwDBGrid2;
    dsIndicador: TwwDataSource;
    dsOutroDadoXUnidAut: TwwDataSource;
    qryOutroDadoXUnidAut: TwwQuery;
    DBcboAtividade: TwwDBLookupCombo;
    Label3: TLabel;
    DBedtAdministradora: TDBEdit;
    btnBuscaAdmin: TBitBtn;
    Bevel1: TBevel;
    btnLimpaAdmin: TBitBtn;
    DBrdgTipoUnidade: TDBRadioGroup;
    qryIDUNIDAUT: TFloatField;
    qryIDIMOVEL: TFloatField;
    qryIDMARCA: TFloatField;
    qryIDADMINIMOVEL: TFloatField;
    qryIDATIVIDADE: TFloatField;
    qryUNANOME: TStringField;
    qryUNAMATRICULA: TStringField;
    qryUNAPERCENTRATEIO: TFloatField;
    qryFLGTIPOUNIDADE: TStringField;
    qryIMOVEL_EXTENSO: TStringField;
    qryUNAAREA: TFloatField;
    qryUNAAREAGERENCIAL: TFloatField;
    Bevel3: TBevel;
    DBedtAreaTotal: TDBEdit;
    DBedtAreaGerencial: TDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    qryOutroDadoXUnidAutIDUNIDAUT: TFloatField;
    qryOutroDadoXUnidAutIDOUTRODADO: TFloatField;
    qryOutroDadoXUnidAutODUVALOR: TStringField;
    qryOutroDadoXUnidAutODODESCRICAO: TStringField;
    qryNF_ADMIN: TStringField;
    qryRS_ADMIN: TStringField;

    // procedimentos definidos
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);

    procedure FazerRefresh; override;

    procedure Sel(i: integer);

    procedure AbreDetalhes(i: integer);
    procedure FechaDetalhes;
    procedure FechaQueries; override;

    function VerificaPreenchimento: boolean;
    procedure btnBuscaAdminClick(Sender: TObject);
    procedure btnLimpaAdminClick(Sender: TObject);
    procedure DBedtAreaTotalExit(Sender: TObject);
    procedure btnBuscaImovelClick(Sender: TObject);
    procedure btnPorDataClick(Sender: TObject);
    procedure btnPorTipoClick(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);


  private { Private declarations }
   iUnidAut : integer;      

  public { Public declarations }

  end;



var
  frmCadUnidadeAutonoma: TfrmCadUnidadeAutonoma;



implementation
{$R *.DFM}
uses
   USistema, UMensErro, UDatabase, DBaseDados, UComunsImobiliario, uVerificaPreenchimento, dLookImobiliario,
   uFuncoesImob, DMS;



procedure TfrmCadUnidadeAutonoma.CmeCadastroFind(Sender: TObject);
begin
	inherited;

	// redesenha o form na volta do MontaSelect
	Repaint;

	// se houve busca, abre a query principal com apenas o registro buscado
	if MontaSelect.RetornouValor then begin

      Screen.Cursor := crHourGlass;

		FechaDetalhes;

		iUnidAut := StrToInt(MontaSelect.ValoresChave[0]);
      Sel(iUnidAut);

      AbreDetalhes(iUnidAut);

      Screen.Cursor := crDefault;
   end;
end;



procedure TfrmCadUnidadeAutonoma.CmeCadastroInsert(Sender: TObject);
begin
  FechaDetalhes;

  // abre a query principal contendo zero registros
  Sel(-1);

  inherited;

  // abre as queries detalhe com zero registros (o novo registro não tem filhos, afinal...)
  AbreDetalhes(iUnidAut);

  if DBedtMatricula.CanFocus then DBedtMatricula.SetFocus;
end;



procedure TfrmCadUnidadeAutonoma.CmeCadastroEdit(Sender: TObject);
begin
   inherited;

   if DBedtMatricula.CanFocus then DBedtMatricula.SetFocus;
end;



procedure TfrmCadUnidadeAutonoma.CmeCadastroConfirma(Sender: TObject);
begin
   try
      if CmeCadastro.Operacao = opInserir then begin
         qryIDUNIDAUT.asInteger := LeUltRegistro(nil, 'UNIDAUT');
      end;

      inherited; 

   except
      Screen.Cursor := crDefault;
      Raise;
      Repaint;
   end;
end;



procedure TfrmCadUnidadeAutonoma.FazerRefresh;
begin
   inherited;
   AbreDetalhes(iUnidAut);
end;



procedure TfrmCadUnidadeAutonoma.Sel(i: integer);
begin
   with qry do begin
      LimpaParametros(qry);
      Params[0].asInteger := i;
      Open;
   end;
end;



procedure TfrmCadUnidadeAutonoma.AbreDetalhes(i: integer);
begin
   dtmLookImobiliario.qryLookMarca.Close;
   dtmLookImobiliario.qryLookMarca.Open;

   dtmLookImobiliario.qryLookAtividade.Close;
   dtmLookImobiliario.qryLookAtividade.Open;

   with qryOutroDadoXUnidAut do begin
      LimpaParametros(qryOutroDadoXUnidAut);
      ParamByName('PIDUNIDAUT').AsInteger := i;
      Open;
   end;

   with dtmLookImobiliario.qryLookIndicadorPorData do begin
      LimpaParametros(dtmLookImobiliario.qryLookIndicadorPorData);
      ParamByName('PIDUNIDAUT').AsInteger := i;
      Open;
   end;

   with dtmLookImobiliario.qryLookIndicadorPorTipo do begin
      LimpaParametros(dtmLookImobiliario.qryLookIndicadorPorTipo);
      ParamByName('PIDUNIDAUT').AsInteger := i;
      Open;
   end;

end;



procedure TfrmCadUnidadeAutonoma.FechaDetalhes;
begin
   qryOutroDadoXUnidAut.Close;
end;



procedure TfrmCadUnidadeAutonoma.FechaQueries;
begin
   qry.Close;

   qryOutroDadoXUnidAut.Close;

   dtmLookImobiliario.qryLookIndicadorPorData.Close;
   dtmLookImobiliario.qryLookIndicadorPorTipo.Close;
   dtmLookImobiliario.qryLookMarca.Close;
   dtmLookImobiliario.qryLookAtividade.Close;
end;



function TfrmCadUnidadeAutonoma.VerificaPreenchimento: boolean;
begin
	Result := False;

	try

      if ( qryUNANOME.isNULL ) then
         raise EValidacao.CreateVal('É necessário indicar o Nome da Unidade Autônoma!', DBedtNome);

      if ( qryIDIMOVEL.isNULL ) then
         raise EValidacao.CreateVal('É necessário indicar o Imóvel ao qual está ligada a Unidade Autônoma!', btnBuscaImovel);

      if ( qryUNAAREA.isNULL ) or ( qryUNAAREA.AsFloat = 0 ) then
         raise EValidacao.CreateVal('É necessário indicar a Área Total da Unidade Autônoma!', DBedtAreaTotal);

      if ( qryUNAAREAGERENCIAL.isNULL ) or ( qryUNAAREAGERENCIAL.AsFloat = 0 ) then
         raise EValidacao.CreateVal('É necessário indicar a ABL (Área Bruta Locável) da Unidade Autônoma!', DBedtAreaGerencial);

      if ( qryFLGTIPOUNIDADE.isNULL ) then
         raise EValidacao.CreateVal('É necessário se a Unidade é âncora ou satélite!', DBrdgTipoUnidade);

	except

      on ev : EValidacao do begin
         Screen.Cursor := crDefault;
         if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
			Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;

   Result := True;
end;



procedure TfrmCadUnidadeAutonoma.btnBuscaAdminClick(Sender: TObject);
begin
   inherited;
   if qry.State in dsEditModes then begin

      dtmMS.MS_AdminImovel.Executar;

      // redesenha o form na volta do MontaSelect
      Repaint;

      // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
      if dtmMS.MS_AdminImovel.RetornouValor then begin

         Screen.Cursor := crHourGlass;

         qryIDADMINIMOVEL.asInteger := StrToInt(dtmMS.MS_AdminImovel.ValoresChave[0]);
         qryNF_ADMIN.asString       := dtmMS.MS_AdminImovel.ValoresChave[1];
         qryRS_ADMIN.asString       := dtmMS.MS_AdminImovel.ValoresChave[2];

         Screen.Cursor := crDefault;
      end;

      btnBuscaAdmin.SetFocus;
   end;
end;



procedure TfrmCadUnidadeAutonoma.btnLimpaAdminClick(Sender: TObject);
begin
   inherited;
   if qry.State in dsEditModes then begin
      qryNF_ADMIN.Clear;
      qryRS_ADMIN.Clear;
      qryIDADMINIMOVEL.Clear;
   end;
end;



procedure TfrmCadUnidadeAutonoma.DBedtAreaTotalExit(Sender: TObject);
begin
   inherited;
   if qryUNAAREAGERENCIAL.isNULL then qryUNAAREAGERENCIAL.asFloat := qryUNAAREA.asFloat;
end;



procedure TfrmCadUnidadeAutonoma.btnBuscaImovelClick(Sender: TObject);
begin
   inherited;

   if qry.State in [dsInsert, dsEdit] then begin

      dtmMS.MS_Imovel.Executar;

      // redesenha o form na volta do MontaSelect
      Repaint;

      // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
      if dtmMS.MS_Imovel.RetornouValor then begin

         Screen.Cursor := crHourGlass;

         qryIDIMOVEL.asInteger      := StrToInt(dtmMS.MS_Imovel.ValoresChave[1]);
         qryIMOVEL_EXTENSO.asString := dtmMS.MS_Imovel.ValoresChave[2] + ' - ' +
                                      dtmMS.MS_Imovel.ValoresChave[3];
      end;

      btnBuscaImovel.SetFocus;
   end;

   Screen.Cursor := crDefault;
end;



procedure TfrmCadUnidadeAutonoma.btnPorDataClick(Sender: TObject);
begin
   inherited;
   dsIndicador.Dataset := dtmLookImobiliario.qryLookIndicadorPorData;
end;



procedure TfrmCadUnidadeAutonoma.btnPorTipoClick(Sender: TObject);
begin
   inherited;
   dsIndicador.Dataset := dtmLookImobiliario.qryLookIndicadorPorTipo;
end;



procedure TfrmCadUnidadeAutonoma.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
   inherited;
   Accept := VerificaPreenchimento;
end;

end.

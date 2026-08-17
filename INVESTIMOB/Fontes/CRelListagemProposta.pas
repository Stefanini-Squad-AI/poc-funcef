unit CRelListagemProposta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CRel, ExtCtrls, StdCtrls, MontaSelect, Db, DBTables,
  Wwquery, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97,
  wwdblook, wwdbdatetimepicker, CMDateTimePicker;

type
  TcfgRelListagemProposta = class(TcfgRel)
    Label1: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    btnBuscaContrato: TBitBtn;
    edtProNome: TEdit;
    edtProNumero: TEdit;
    btnLimpaContrato: TBitBtn;
    grpDatas: TGroupBox;
    Label5: TLabel;
    edtDataIni: TCMDateTimePicker;
    edtDataFim: TCMDateTimePicker;
    rdgOrdenacao: TRadioGroup;
    DBcboTipoImovel: TwwDBLookupCombo;
    rdgStatus: TRadioGroup;
    btnLimpaResponsavel: TBitBtn;
    btnBuscaResponsavel: TBitBtn;
    btnLimpaProponente: TBitBtn;
    btnBuscaProponente: TBitBtn;
    edtResponsavel: TEdit;
    edtProponente: TEdit;

    procedure btnBuscaContratoClick(Sender: TObject);
    procedure btnLimpaContratoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnBuscaResponsavelClick(Sender: TObject);
    procedure btnLimpaResponsavelClick(Sender: TObject);
    procedure btnBuscaProponenteClick(Sender: TObject);
    procedure btnLimpaProponenteClick(Sender: TObject);


  private { Private declarations }
    sProposta     : string;
    iProponente   : integer;
    iResponsavel  : integer;

    procedure FiltraProposta;
    procedure MontaQuery; override;

  public { Public declarations }

  end;



var
  cfgRelListagemProposta: TcfgRelListagemProposta;



implementation
{$R *.DFM}
uses
   uSistema, uMensErro, uDatabase, dBaseDados, uComunsImobiliario, uVerificaPreenchimento,
   dRelInvestImob, uDiasInUteis, dLookImobiliario, uFuncoesImob, DMS;



procedure TcfgRelListagemProposta.MontaQuery;
begin
   with dtmRelInvestImob do begin
      rptListagemPropostalblDataIni.Caption  := edtDataIni.Text;
      rptListagemPropostalblDataFim.Caption  := edtDataFim.Text;
      rptListagemPropostalblSegmento.Caption := DBcboTipoImovel.Text;
      rptListagemPropostalblStatus.Caption   := rdgStatus.Items[rdgStatus.ItemIndex];
   end;

   FiltraProposta;
end;



procedure TcfgRelListagemProposta.FiltraProposta;
begin
   with dtmRelInvestImob.qryListagemProposta do begin

      Close;

      SQL.Text :=
      'SELECT ' + #13 +
      '   P.IDPROPOSTA, P.IDEMPRESAPROP, ' + #13 +
      '   P.PRODATA, P.PRONOME, P.PRODESCRICAO, ' + #13 +
      '   P.PROVLROM, P.PROVLR, P.PROTIR, P.PROPAYBACK, ' + #13 +
      '   P.PROCONDICOES, P.PROAPRESENTADA, P.PRONUMERO, ' + #13 +

      '   PP.NOME AS NF_PROPRIETARIO, ' + #13 +
      '   PP.RAZAOSOCIAL AS RS_PROPRIETARIO, ' + #13 +
      '   (PP.NOME||'', ''||PP.RAZAOSOCIAL) AS COMPLETO_PROPRIETARIO, ' + #13 +
      '   PR.NOME AS NF_RESPONSAVEL, ' + #13 +
      '   TI.DESCTIPOIMOVEL AS TIPO_IMOVEL, ' + #13 +
      '   M.MOESIGLA ' + #13 +

      'FROM ' + #13 +
      '   PESSOA PP, PESSOA PR, ' + #13 +
      '   PROPOSTANOVONEGOC P, ' + #13 +
      '   TIPOIMOVEL TI, MOEDA M ' + #13 +

      'WHERE ' + #13 +
      '   ( P.IDEMPRESAPROP = ' + IntToStr(Sistema.idEmpresa) + ' ) ' + #13;

      if sProposta <> '' then
      SQL.Text := SQL.Text +
      '   AND ( P.IDPROPOSTA = ' + sProposta + ' ) ' + #13;

      if DBcboTipoImovel.LookupValue <> '' then
      SQL.Text := SQL.Text +
      '   AND ( P.CODTIPIMOVEL = ''' + DBcboTipoImovel.LookupValue + ''' ) ' + #13;

      if edtResponsavel.Text <> '' then
      SQL.Text := SQL.Text +
      '   AND ( P.IDRESPONSAVEL = ' + IntToStr(iResponsavel) + ' ) ' + #13;

      if edtProponente.Text <> '' then
      SQL.Text := SQL.Text +
      '   AND ( P.IDPROPRIETARIOUH = ' + IntToStr(iProponente) + ' ) ' + #13;

      if length(trim(edtDataIni.Text)) > 0 then
      SQL.Text := SQL.Text +
      '   AND ( P.PRODATA >= TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edtDataIni.Date) + ''', ''DD/MM/YYYY'') ) ' + #13;

      if length(trim(edtDataFim.Text)) > 0 then
      SQL.Text := SQL.Text +
      '   AND ( P.PRODATA <= TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edtDataFim.Date) + ''', ''DD/MM/YYYY'') ) ' + #13;

      case rdgStatus.ItemIndex of
         0: SQL.Text := SQL.Text + '   AND ( P.FLGSTATUS = ''A'' ) ' + #13;
         1: SQL.Text := SQL.Text + '   AND ( P.FLGSTATUS = ''I'' ) ' + #13;
      end;

      SQL.Text := SQL.Text +
      '   AND ( P.IDPROPRIETARIOUH = PP.IDPESSOA(+) ) ' + #13 +
      '   AND ( P.IDRESPONSAVEL = PR.IDPESSOA(+) ) ' + #13 +
      '   AND ( P.CODTIPIMOVEL = TI.CODTIPIMOVEL(+) ) ' + #13 +
      '   AND ( P.MOECODIGO = M.MOECODIGO(+) ) ' + #13 +

      'ORDER BY ' + #13;

      case rdgOrdenacao.ItemIndex of
         0: SQL.Text := SQL.Text + '   P.PRODATA, P.PRONUMERO, P.PRONOME ';
         1: SQL.Text := SQL.Text + '   P.PRONUMERO, P.PRONOME, P.PRODATA ';
         2: SQL.Text := SQL.Text + '   P.PRONOME, P.PRONUMERO, P.PRODATA ';
      end;

      Open;
   end;
end;



procedure TcfgRelListagemProposta.btnBuscaContratoClick(Sender: TObject);
begin
	inherited;

   dtmMS.MS_Proposta.Executar;

	// redesenha o form na volta do MontaSelect
	Repaint;

	// se houve busca, abre a query principal com apenas o registro buscado
	if dtmMS.MS_Proposta.RetornouValor then begin

      Screen.Cursor     := crHourGlass;

      sProposta         := dtmMS.MS_Proposta.ValoresChave[0];
      edtProNumero.Text := dtmMS.MS_Proposta.ValoresChave[1];
      edtProNome.Text   := dtmMS.MS_Proposta.ValoresChave[2];

      Screen.Cursor     := crDefault;
   end;
end;



procedure TcfgRelListagemProposta.btnLimpaContratoClick(Sender: TObject);
begin
   inherited;
   sProposta := '';

   edtProNumero.Clear;
   edtProNome.Clear;
end;



procedure TcfgRelListagemProposta.FormShow(Sender: TObject);
begin
   inherited;

   dtmLookImobiliario.qryLookTipoImovel.Open;

   iProponente    := -1;
   iResponsavel   := -1;
end;



procedure TcfgRelListagemProposta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   dtmLookImobiliario.qryLookTipoImovel.Close;
   inherited;
end;



procedure TcfgRelListagemProposta.btnBuscaResponsavelClick(Sender: TObject);
begin
   inherited;

   dtmMS.MS_Responsavel.Executar;

   // redesenha o form na volta do MontaSelect
   Repaint;

   // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
   if dtmMS.MS_Responsavel.RetornouValor then begin

      Screen.Cursor := crHourGlass;

      iResponsavel         := StrToInt(dtmMS.MS_Responsavel.ValoresChave[0]);
      edtResponsavel.Text  := dtmMS.MS_Responsavel.ValoresChave[1];

      Screen.Cursor := crDefault;
   end;

   btnBuscaResponsavel.SetFocus;
end;



procedure TcfgRelListagemProposta.btnLimpaResponsavelClick(Sender: TObject);
begin
   inherited;

   iResponsavel := -1;
   edtResponsavel.Clear;
end;



procedure TcfgRelListagemProposta.btnBuscaProponenteClick(Sender: TObject);
begin
   inherited;

   dtmMS.MS_Proprietario.Executar;

   // redesenha o form na volta do MontaSelect
   Repaint;

   // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
   if dtmMS.MS_Proprietario.RetornouValor then begin

      Screen.Cursor := crHourGlass;

      iProponente         := StrToInt(dtmMS.MS_Proprietario.ValoresChave[0]);
      edtProponente.Text  := dtmMS.MS_Proprietario.ValoresChave[1];

      Screen.Cursor := crDefault;
   end;

   btnBuscaProponente.SetFocus;
end;



procedure TcfgRelListagemProposta.btnLimpaProponenteClick(Sender: TObject);
begin
   inherited;

   iProponente := -1;
   edtProponente.Clear;
end;



end.

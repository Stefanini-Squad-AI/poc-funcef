{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------

--------------------------------------------------------------------------------
SOL  : 131826
KTN  : 754103
Responsável : Felipe de Oliveira Silva
Data        : 23/04/2010
Descrição   : Alterada função que monta a query do relatório para contar a qtde
              de imóveis que o select traz, totalizando no fim do relatório 
--------------------------------------------------------------------------------}

unit CRelListagemImovelSegmento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CRel, StdCtrls, wwdblook, Db, DBTables, Wwquery, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, uModuloImobiliario,
  Wwdatsrc;

type
  Tcfgrellistagemimovelseg = class(TcfgRel)
    Label1: TLabel;
    chkArea: TCheckBox;
    chkAquisicao: TCheckBox;
    edtImovelMestre: TEdit;
    btnBuscaImovelMestre: TBitBtn;
    btnLimpaImovelMestre: TBitBtn;
    rdgOcupacao: TRadioGroup;
    chkAtivo: TCheckBox;
    rdgSegmento: TRadioGroup;
    GroupBox1: TGroupBox;
    dblkpFiltroGerencial: TwwDBLookupCombo;
    dblkpFiltroSpc: TwwDBLookupCombo;
    procedure btnBuscaImovelMestreClick(Sender: TObject);
    procedure btnLimpaImovelMestreClick(Sender: TObject);
    procedure rdgSegmentoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);


  private { Private declarations }
    iImovelMestre : integer;

    procedure MontaQuery; override;

  public { Public declarations }

  end;



var
  cfgrellistagemimovelseg: Tcfgrellistagemimovelseg;



implementation
{$R *.DFM}
uses
   uSistema, uMensErro, UComunsImobiliario, uVerificaPreenchimento, dRelAdminImob,
   dLookImobiliario, DMS, uFuncoesImob;



procedure Tcfgrellistagemimovelseg.MontaQuery;
var iTotalImo : integer;
begin

   // Carrega o Logotipo - Marcio Motta - 28/06/2004
   if ModuloImobiliario.AdminImob.bFlgLogoRelat then
      dtmRelAdminImob.ppLogotipo.Picture := ModuloImobiliario.AdminImob.LogoTipo.Picture
   else
      dtmRelAdminImob.ppLogotipo.Picture := nil;

   // preenche as flags
   dtmRelAdminImob.bArea      := chkArea.Checked;
   dtmRelAdminImob.bAquisicao := chkAquisicao.Checked;

   with dtmRelAdminImob.qryListagemImovelSeg do begin
      LimpaParametros(dtmRelAdminImob.qryListagemImovelSeg);
      ParamByName('PIDPESSOA').asInteger              := Sistema.idEmpresa;

      // Imóvel Mestre
      if length(trim(edtImovelMestre.Text)) > 0 then
         ParamByName('PIDIMOVELMESTRE').asInteger     := iImovelMestre;

      // Ocupação
      case rdgOcupacao.ItemIndex of
      0: ParamByName('PFLGSTATUSOCUPACAO').asString   := 'O';
      1: ParamByName('PFLGSTATUSOCUPACAO').asString   := 'D';
      end;

      // Segmento Gerencial - SPC  - Marcos Topini em 10/08/2005
      case rdgSegmento.ItemIndex of
       0: begin
           ParamByName('pSEGMENTO').AsInteger := 0;
           if Trim(dblkpFiltroGerencial.LookupValue) <> '' then
             ParamByName('PCODTIPIMOVEL').AsString := dtmLookImobiliario.qryLookTipoImovel.FieldByName('CODTIPIMOVEL').AsString;
           dtmRelAdminImob.ppLGerencial_SPC0.Caption := 'Segmento Gerencial:';
           dtmRelAdminImob.ppLGerencial_SPC1.Caption := 'Segmento Spc'
          end;
       1: begin
           ParamByName('pSEGMENTO').AsInteger := 1;
           if Trim(dblkpFiltroSpc.LookupValue) <> '' then
             ParamByName('PIDCARTEIRASPC').AsInteger := dtmLookImobiliario.qryLookSegmentoSPC.FieldByName('IDCARTEIRASPC').AsInteger;
           dtmRelAdminImob.ppLGerencial_SPC0.Caption := 'Segmento Spc:';
           dtmRelAdminImob.ppLGerencial_SPC1.Caption := 'Segmento Gerencial'

          end
      end;
      // Fim Segmento Gerencial

      // Área
      if chkArea.Checked then
         ParamByName('PIMOAREA').asFloat              := 1;

      // Valor de Aquisição
      if chkAquisicao.Checked then
         ParamByName('PIMOVLRCOMPRA').asFloat         := 1;

      // Imóvel Ativo
      if chkAtivo.Checked then
         ParamByName('PFLGATIVO').asInteger           := 1;

      Open;
// SOL  : 131826 -  KTN  : 754103 Felipe de Oliveira
// realiza a contagem dos registros do select q faz a seleção dos imóveis
      if not(dtmRelAdminImob.qryListagemImovelSeg.IsEmpty) then
      begin
         iTotalImo := 0;
         while not(dtmRelAdminImob.qryListagemImovelSeg.Eof) do
         begin
            iTotalImo := iTotalImo + 1;
            dtmRelAdminImob.qryListagemImovelSeg.Next;
         end;
      end;
      dtmRelAdminImob.pplblTotal.Caption :=  inttostr(iTotalImo);
   end;
end;



procedure Tcfgrellistagemimovelseg.btnBuscaImovelMestreClick(Sender: TObject);
begin
   inherited;

   dtmMS.MS_ImovelMestre.Executar;

   // redesenha o form na volta do MontaSelect
   Repaint;

   // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
   if dtmMS.MS_ImovelMestre.RetornouValor then begin

      Screen.Cursor := crHourGlass;

      iImovelMestre        := StrToInt(dtmMS.MS_ImovelMestre.ValoresChave[0]);
      edtImovelMestre.Text := dtmMS.MS_ImovelMestre.ValoresChave[1];

      Screen.Cursor := crDefault;
   end;

   btnBuscaImovelMestre.SetFocus;
end;



procedure Tcfgrellistagemimovelseg.btnLimpaImovelMestreClick(Sender: TObject);
begin
   inherited;

   iImovelMestre := -1;
   edtImovelMestre.Clear;
end;



procedure Tcfgrellistagemimovelseg.rdgSegmentoClick(Sender: TObject);
begin
  inherited;
  case rdgSegmento.ItemIndex of
   0 : begin
        // Filtra a combo por segmento gerencial
        dblkpFiltroGerencial.Visible := true;
        dblkpFiltroSpc.Visible       := false;
       end;
   1 : begin
        // Filtra a combo por segmento SPC
        dblkpFiltroGerencial.Visible := false;
        dblkpFiltroSpc.Visible       := true;
       end;
  end
end;

procedure Tcfgrellistagemimovelseg.FormCreate(Sender: TObject);
begin
  inherited;
  dtmLookImobiliario.qryLookTipoImovel.open;
  dtmLookImobiliario.qryLookSegmentoSPC.open
end;

procedure Tcfgrellistagemimovelseg.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dtmLookImobiliario.qryLookTipoImovel.close;
  dtmLookImobiliario.qryLookSegmentoSPC.close;
  inherited;

end;

end.

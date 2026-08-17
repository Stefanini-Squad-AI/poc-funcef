unit dMS;

// =================================================================================================
//    Valores-chave dos MontaSelect
// =================================================================================================
{
   MS_AdminImovel
      [0] A.IDADMINIMOVEL
      [1] P.NOME
      [2] P.RAZAOSOCIAL

   MS_Bem
      [0] B.IDBEM
      [1] B.CONTROLE
      [2] B.REGISTRO
      [3] B.PLACA

   MS_Cartorio
      [0] C.IDCARTORIO
      [1] P.NOME
      [2] P.RAZAOSOCIAL
      [3] P.NUMDOCUMENTO

   MS_CContabil
      [0] PLANOCONTA.PLACONTA
      [1] PLANOCONTA.PLANOME
      [2] PLANOCONTA.PLASUBCONTA
      [3] PLANOCONTA.PLACCUST

   MS_Cliente
      [0] E.IDFORCLI
      [1] P.NOME
      [2] P.RAZAOSOCIAL
      [3] P.NUMDOCUMENTO

   MS_Contrato
      [0] C.IDCONTRATOIMOVEL
      [1] C.CONNUMERO
      [2] C.CONNOME
      [3] C.FLGTIPOCONTRATO
      [4] PL.NOME
      [5] PL.RAZAOSOCIAL
      [6] C.CONQUANTVAGAS
      [7] C.IDLOCATARIO
      [8] C.CODPORTFORMA

   MS_Fiador
      [0] A.IDAVALISTA
      [1] PA.NOME
      [2] PA.RAZAOSOCIAL
      [3] PA.NUMDOCUMENTO

   MS_Forn
      [0] E.IDFORCLI
      [1] PF.NOME
      [2] PF.RAZAOSOCIAL
      [3] PF.NUMDOCUMENTO

   MS_Imovel
      [0] IM.IDIMOVEL
      [1] I.IDIMOVEL
      [2] IM.IMONOME
      [3] I.IMONOME
      [4] I.CODTIPIMOVEL
      [5] I.IDCARTEIRAINVEST
      [6] T.DESCTIPOIMOVEL
      [7] I.IMOCODIGO
      [8] I.IMOAREA
      [9] I.FLGTIPOIMOVEL

   MS_ImovelAtivo
       [0] IM.IDIMOVEL
       [1] I.IDIMOVEL
       [2] IM.IMONOME
       [3] I.IMONOME
       [4] I.CODTIPIMOVEL
       [5] I.IDCARTEIRAINVEST
       [6] T.DESCTIPOIMOVEL
       [7] I.IMOCODIGO
       [8] I.IMOAREA
       [9] CA.DESCCARTINVEST
      [10] I.CODSUBCONTA

   MS_ImovelContrato
      [0] CX.IDCONTRATOIMOVEL

   MS_ImovelContratoV
      [0] CX.IDCONTRATOIMOVEL

   MS_ImovelMestre
      [0] IM.IDIMOVEL
      [1] IM.IMONOME

   MS_ImovelouMestre
      [0] IM.IDIMOVEL
      [1] I.IDIMOVEL
      [2] IM.IMONOME
      [3] I.IMONOME
      [4] I.CODTIPIMOVEL
      [5] I.IDCARTEIRAINVEST
      [6] T.DESCTIPOIMOVEL
      [7] I.IMOCODIGO
      [8] I.IMOAREA
      [9] I.FLGTIPOIMOVEL

   MS_Lancamento
      [0] VW.IDLANCIMOVEL
      [1] VW.CODDOCUMENTO
      [2] VW.PLNCODIGO
      [3] VW.NODOCUMENTO
      [4] VW.IDPESSOA
      [5] VW.CODTIPIMOVEL
      [6] VW.IDDOCUMENTO
      [6] VW.RECPAG

   MS_Locatario
      [0] L.IDLOCATARIO
      [1] P.NOME
      [2] P.RAZAOSOCIAL
      [3] P.NUMDOCUMENTO

   MS_Proposta
      [0] P.IDPROPOSTA
      [1] P.PRONUMERO
      [2] P.PRONOME
      [3] P.CODTIPIMOVEL

   MS_Proprietario
      [0] P.IDPROPRIETARIOUH
      [1] PP.NOME
      [2] PP.RAZAOSOCIAL
      [3] PP.NUMDOCUMENTO

   MS_ReservaOrcamen
      [0] R.IDRESERVAORCAMEN
      [1] R.NUMRESERVA

   MS_Responsavel
      [0] R.IDRESPONSAVEL
      [1] PR.NOME
      [2] PR.RAZAOSOCIAL
      [3] PR.NUMDOCUMENTO

   MS_UnidAut
      [0] U.IDUNIDAUT
      [1] U.UNANOME
      [2] IM.IDIMOVEL
      [3] I.IDIMOVEL
      [4] IM.IMONOME
      [5] I.IMONOME
      [6] I.CODTIPIMOVEL
}
// =================================================================================================

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  MontaSelect;

type
  TdtmMS = class(TDataModule)
    MS_AdminImovel: TMontaSelect;
    MS_Bem: TMontaSelect;
    MS_Cartorio: TMontaSelect;
    MS_CContabil: TMontaSelect;
    MS_Cliente: TMontaSelect;
    MS_Contrato: TMontaSelect;
    MS_Fiador: TMontaSelect;
    MS_Forn: TMontaSelect;
    MS_ImovelouMestre: TMontaSelect;
    MS_ImovelMestre: TMontaSelect;
    MS_ImovelAtivo: TMontaSelect;
    MS_Imovel: TMontaSelect;
    MS_Lancamento: TMontaSelect;
    MS_Locatario: TMontaSelect;
    MS_Proposta: TMontaSelect;
    MS_Proprietario: TMontaSelect;
    MS_ReservaOrcamen: TMontaSelect;
    MS_Responsavel: TMontaSelect;
    MS_UnidAut: TMontaSelect;
    MS_Usuario: TMontaSelect;
    MS_ImovelContratoV: TMontaSelect;
    MS_ImovelContrato: TMontaSelect;
    MS_ImovelInativo: TMontaSelect;
    MS_BemFisico: TMontaSelect;
    MS_Seguradora: TMontaSelect;
    MS_ImovelInativoouMestre: TMontaSelect;
    MS_Localizacao: TMontaSelect;
    MS_ClasseBem: TMontaSelect;
    MS_ImovelObra: TMontaSelect;
    MS_AlienaProposta: TMontaSelect;
    MS_AlienaContrato: TMontaSelect;
    MS_AlienaPropostaContrato: TMontaSelect;
    MS_AlienaRepactua: TMontaSelect;

    procedure DataModuleCreate(Sender: TObject);

  private { Private declarations }

  public { Public declarations }

   // criar e limpar os itens default de um Monta Select
   procedure LimpaMS(const MS_: TMontaSelect);


  end;



var
  dtmMS: TdtmMS;



implementation
{$R *.DFM}



// criar e limpar os itens default de um Monta Select
procedure TdtmMS.LimpaMS(const MS_: TMontaSelect);
var
   i: integer;
begin
   MS_.ItemsBusca.Clear;
   for i := 0 to (MS_.Colunas.Count - 1) do MS_.ItemsBusca.Add('');
end;



procedure TdtmMS.DataModuleCreate(Sender: TObject);
begin
// =================================================================================================
//    Valores default para os MontaSelect
// =================================================================================================

   LimpaMS(dtmMS.MS_Proposta);
   dtmMS.MS_Proposta.ItemsBusca[1] := 'Ativa';
{
   LimpaMS(dtmMS.MS_Imovel);
   dtmMS.MS_Imovel.ItemsBusca[2] := 'Ativo';

   LimpaMS(dtmMS.MS_ImovelAtivo);
   dtmMS.MS_ImovelAtivo.ItemsBusca[2] := 'Ativo';
}
   LimpaMS(dtmMS.MS_ImovelContrato);
   dtmMS.MS_ImovelContrato.ItemsBusca[6] := 'Vigente';
{
   LimpaMS(dtmMS.MS_Contrato);
   dtmMS.MS_Contrato.ItemsBusca[2] := 'Vigente';
}
// =================================================================================================
//
// =================================================================================================
end;



end.

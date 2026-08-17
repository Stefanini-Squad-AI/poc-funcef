// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Camille
// Data        : 07.07.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO 
//------------------------------------------------------------------------------
unit FParamRelCadastrais;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, ExtCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97;

type
  TfrmParamRelCadastrais = class(TfrmOkCancelar)
    rgrTabelas: TRadioGroup;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure MontaRelatorio(sTitulo, sColuna1, sColuna2, sSQL: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamRelCadastrais: TfrmParamRelCadastrais;

implementation

uses DRelatAdmPrev, UAdmPrev;

{$R *.DFM}

procedure TfrmParamRelCadastrais.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  case rgrTabelas.ItemIndex of
     0 : // Contribuições
         MontaRelatorio('Relação de Contribuições Previdenciárias',
          'Código', 'Contribuição',
          ' SELECT IDCONTRIBUICAO AS CODIGO, NOME FROM CONTRIBUICAO '+
          ' WHERE  IDCONTRIBUICAO IN (SELECT CP.IDCONTRIBUICAO      '+
          '                           FROM   CONTPREV CP, PLANPREVPATRO PLP, PATRO PT '+     
          '                           WHERE  PT.IDFUNDACAO = '+IntToStr(iIdFundacao)   +
          '                           AND    PLP.IDPESSJUR = PT.IDPESSOA               '+
          '                           AND    CP.IDPLANOPREV = PLP.IDPLANOPREV )        '+
          ' ORDER BY NOME');

     1 : // Benefícios
         MontaRelatorio('Relação de Benefícios Previdenciários',
          'Código', 'Benefício',
          ' SELECT IDBENEFICIO AS CODIGO, NOME FROM BENEFICIO '+
          ' WHERE  IDBENEFICIO IN (SELECT BP.IDBENEFICIO         '+
          '                           FROM   BENEFPLANPREV BP, PLANPREVPATRO PLP, PATRO PT '+
          '                           WHERE  PT.IDFUNDACAO = '+IntToStr(iIdFundacao)   +
          '                           AND    PLP.IDPESSJUR = PT.IDPESSOA               '+
          '                           AND    BP.IDPLANOPREV = PLP.IDPLANOPREV )        '+
          ' ORDER BY NOME');

     2 : // Reservas
         MontaRelatorio('Relação de Tipos de Reserva',
          'Código', 'Tipo de Reserva ',
          ' SELECT IDTIPORESERVA AS CODIGO, NOME FROM RESERVAXPLANO '+
          ' WHERE  IDPLANOPREV IN (SELECT PLP.IDPLANOPREV  '+
          '                        FROM   PLANPREVPATRO PLP, PATRO PT '+                     
          '                        WHERE  PT.IDFUNDACAO = '+IntToStr(iIdFundacao)   +
          '                        AND    PLP.IDPESSJUR = PT.IDPESSOA      )       '+
          ' ORDER BY NOME');

     3 : // Rubricas
         MontaRelatorio('Relação de Rubricas ',
          'Rubrica', 'Descrição',
          'SELECT IDPROVENTO AS CODIGO, DESCRICAO AS NOME FROM PROVDESC ORDER BY DESCRICAO');

     4 : // Planos Previdenciarios
         MontaRelatorio('Relação de Planos Previdenciários',
          'Código', 'Plano Previdenciário',
          ' SELECT IDPLANOPREV AS CODIGO, NOME FROM PLANPREV '+
          ' WHERE  IDPLANOPREV IN (SELECT PLP.IDPLANOPREV  '+
          '                        FROM   PLANPREVPATRO PLP, PATRO PT '+ 
          '                        WHERE  PT.IDFUNDACAO = '+IntToStr(iIdFundacao)   +
          '                        AND    PLP.IDPESSJUR = PT.IDPESSOA      )       '+
          ' ORDER BY NOME');

     5 : // Patrocinadoras
         MontaRelatorio('Relação de Patrocinadoras',
          'Código', 'Patrocinadora',
          ' SELECT P.IDPESSOA AS CODIGO, P.NOME FROM PESSOA P, PATRO PT '+ 
          ' WHERE  PESSOA.IDPESSOA = PT.IDPESSOA                        '+
          ' AND    PT.IDFUNDACAO   = '+IntToStr(iIdFundacao)             );

     6 : // Motivos
         MontaRelatorio('Relação de Motivos',
          'Motivo', 'Descrição',
          'select IDMOTIVO as CODIGO, DESCRICAO as NOME from MOTIVO order by DESCRICAO');

     7 : // Periodicidades
         MontaRelatorio('Relação de Tipos de Periodicidade',
          'Código', 'Periodicidade',
          'select IDTPPERIODICIDADE as CODIGO, NOME  from TPPERIODICIDADE order by NOME');

     8 : //Eventos Geradores
         MontaRelatorio('Relação de Eventos Geradores',
          'Código', 'Evento Gerador',
          'SELECT IDEVENTOGERADOR AS CODIGO, NOME FROM EVENTOGERADOR '+
          'WHERE IDFUNDACAO = '+INTTOSTR(IIDFUNDACAO)+' ORDER BY NOME');

     9 : //Tipos de Pagamento de beneficio
         MontaRelatorio('Relação de Tipos de Pagamento de Benefício',
          'Código', 'Tipo de Pagamento de Benefício',
          'select IDTPPAGTOBENEFIC as CODIGO, NOME from TPPAGTOBENEFICIO order by NOME');

  end;//case
end;

procedure TfrmParamRelCadastrais.MontaRelatorio(sTitulo, sColuna1, sColuna2, sSQL: String);
begin
  with dtmRelatAdmPrev do
    begin
      qryRelCadastrais.Close;
      qryRelCadastrais.SQL.Clear;
      qryRelCadastrais.SQL.Add(sSQL);
      qryRelCadastrais.Prepare;
      qryRelCadastrais.Open;

      pplblTituloRel.Caption  := sTitulo;
      pplblColuna01.Caption   := sColuna1;
      pplblColuna02.Caption   := sColuna2;
      ppdbtColuna01.DataField := 'CODIGO';
      ppdbtColuna02.DataField := 'NOME';
    end;
end;

end.

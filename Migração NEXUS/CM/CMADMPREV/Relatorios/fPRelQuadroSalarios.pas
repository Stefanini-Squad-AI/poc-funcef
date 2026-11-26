// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Nº SIG.....: SIG TIBERO
// Data.......: 06/03/2018
// Responsável: Everson Luiz Pereira da Cunha
// Descrição..: Melhoria no Planus para adequação ao TIBERO.
//              Inclusão de alias nas tabelas e campos.
//              Retirar INDEX, +rule etc
// -----------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 07.07.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
// Rotina      :
// Autor(a)    : Gleyber
// Data        : 12/12/2002
// Alteração   : Acrescentei um rule na query do relatório
// -----------------------------------------------------------------------------


unit fPRelQuadroSalarios;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
  TB97Tlbr, TB97, ExtCtrls, MontaSelect;

type
  TfrmPRelQuadroSalarios = class(TfrmOkCancelar)
    MontaSelect1: TMontaSelect;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edNome: TEdit;
    bbtnProcurar: TBitBtn;
    edInscr: TEdit;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnProcurarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPRelQuadroSalarios: TfrmPRelQuadroSalarios;

implementation

{$R *.DFM}

Uses dRelatAdmPrev2, UAdmPrev;

procedure TfrmPRelQuadroSalarios.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  // verifica se campo inscriçao foi preenchido
  If edInscr.Text = '' Then
  Begin
    ModalResult := MrNone;
    Exit;
  End;

  With dtmRelatAdmPrev2.qryQuadroSalarios Do
  Begin
    Sql.Clear;
    Sql.Add(
//      ' SELECT  /*+ RULE*/ T4.NOME, T3.MES, T3.MESCOBRANCA, T3.VALORPROVENTO AS SALARIO, '+  //Everson TIBERO
      ' SELECT T4.NOME, T3.MES, T3.MESCOBRANCA, T3.VALORPROVENTO AS SALARIO, '+ //Everson TIBERO
      '         T3.IDRUBRICA,T2.DESCRICAO, T5.INSCRICAONUMERO, T6.MATRICULA '+
      ' FROM PATRO T1, PROVDESC T2 , HISTRUBSAL T3, PESSOA T4, '+
      '      PARTPREVPLAN T5, ELEGPATRO T6, PATRO T7 '+
      ' WHERE (  T1.IDRUBSALPARTICIP  = T2.IDPROVENTO '+
      '    OR    T1.IDRUBREMTOTAL     = T2.IDPROVENTO '+
      '    OR    T1.IDRUBSALMANUT     = T2.IDPROVENTO '+
      '    OR    T1.IDRUBSALAUXDOENCA = T2.IDPROVENTO  ) '+
      ' AND   T2.IDPROVENTO       = T3.IDRUBRICA '+
      ' AND   T3.IDPESSOA         = T4.IDPESSOA '+
      ' AND   T5.INSCRICAONUMERO  = '+edInscr.Text+
      ' AND   T3.IDPESSOA         = T5.IDPESSOA '+
      ' AND   T3.IDPESSOA         = T6.IDPESSOA '+
      ' AND   T3.IDPATRO          = T6.IDPESSJUR '+
      ' AND   T5.FLGDESATIVADO    = 0 '+
      ' AND   T6.IDPESSJUR        = T1.IDPESSOA '+
      ' AND   T7.IDPESSOA         = T6.IDPESSJUR '+         
      ' AND   T7.IDFUNDACAO       = '+IntToStr(iIdFundacao)+
      ' ORDER BY MES DESC ');
    End;
end;

procedure TfrmPRelQuadroSalarios.bbtnProcurarClick(Sender: TObject);
begin
  inherited;
  MontaSelect1.executar;
  If MontaSelect1.retornouValor Then
  Begin
    EdNome.Text := MontaSelect1.ValoresChave[1];
    EdInscr.Text := MontaSelect1.ValoresChave[2];
  End;
end;

procedure TfrmPRelQuadroSalarios.FormShow(Sender: TObject);
begin
  inherited;
  MontaSelect1.Filtro.Add('PP.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')'); 
end;

end.

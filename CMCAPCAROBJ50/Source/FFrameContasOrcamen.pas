unit FFrameContasOrcamen;

{ --------------------------------------------------------------------------------------------------
Nº SOL......: 172384/9603
Nº KINTANA..: 1661662
Data........: 25/06/2012
Responsável.: Vander Campos
Descrição...: Criação do Frame
Utilizado em: [ CmCapCarObj50 ] FTrdxCCxContaMT
-------------------------------------------------------------------------------------------------- }

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, wwdbedit, MontaSelect, uCtrlOrcamento;

type
  TFrameContasOrcamen = class(TFrame)
    gbMargem: TGroupBox;
    MontaSelectConta: TMontaSelect;
    lblCodigoConta: TLabel;
    dbeCodigoConta: TwwDBEdit;
    Label3: TLabel;
    edtCentroResp: TEdit;
    edtGrupo: TEdit;
    Label11: TLabel;
    edtNomeConta: TEdit;
    lblNome: TLabel;
    bbtnBuscaConta: TBitBtn;
    procedure bbtnBuscaContaClick(Sender: TObject);
  private
    FIDContaOcamen : String;
    //FSaldo         : Double;

    FInfModulo    : Boolean;
    //Variáreis do Módulo
    FiPlanoOrc          : Integer;
    FsMascaraCentRespon : String;
    FsMascaraGrupo      : String;
  public
    Property IDCONTAORCAMEN : String Read FIDContaOcamen;
    //PRoperty Saldo          : Double Read FSaldo;

    Procedure SetInfoModulo(AiPlanoOrc : Integer; AsMascaraCentRespon, AsMascaraGrupo : String);
  end;

implementation

{$R *.DFM}

procedure TFrameContasOrcamen.bbtnBuscaContaClick(Sender: TObject);
var
   sNomeConta, sCodCentroRespon, sNomeCentroRespon, sCodGrupo,
   sNomeGrupo, sUnid, sPPrev, sCCusto, sPatro : String;
begin
  inherited;

  Assert( FInfModulo, 'Utilize o método SetInfoModulo no construtor do formulário!');

  //Busca a Conta Orçamentária
  MontaSelectConta.Executar;
  if MontaSelectConta.RetornouValor then
   begin
    if OrcamentoBackMT.BuscaContaOrcamen(FiPlanoOrc,
       MontaSelectConta.ValoresChave[1],true,true,sNomeConta,sCodCentroRespon,
       sNomeCentroRespon,sCodGrupo,sNomeGrupo, sUnid,sPPrev,sCCusto,sPatro) = 0
       then begin
      dbeCodigoConta.text := MontaSelectConta.ValoresChave[1];
      //cds.FieldByName('IDCONTAORCAMEN').asString := MontaSelectConta.ValoresChave[1];

      FIDContaOcamen     := MontaSelectConta.ValoresChave[1];

      edtNomeConta.text  := sNomeConta;
      edtCentroResp.text := FormatMaskText(FsMascaraCentRespon + ';0; ',
                            sCodCentroRespon) + ' - ' + sNomeCentroRespon;
      edtGrupo.text      := FormatMaskText(FsMascaraGrupo + ';0; ',
                            sCodGrupo) + ' - ' + sNomeGrupo;
      //FSaldo             := OrcamentoBackMT.ExibeSaldo(modulo.iPlanoOrc,
      //                      dbeCodigoConta.text,DateToStr(date),
      //                      modulo.sTipoSaldo);
    end else begin
      dbeCodigoConta.clear;
      edtNomeConta.clear;
      edtCentroResp.clear;
      edtGrupo.clear;
      //FSaldo         := 0;
      FIDContaOcamen := '';
      if dbeCodigoConta.CanFocus then dbeCodigoConta.SetFocus;
    end;
  end;

end;

procedure TFrameContasOrcamen.SetInfoModulo(AiPlanoOrc: Integer;  AsMascaraCentRespon, AsMascaraGrupo: String);
begin
  FInfModulo          := TRUE;

  FiPlanoOrc          := AiPlanoOrc         ;
  FsMascaraCentRespon := AsMascaraCentRespon;
  FsMascaraGrupo      := AsMascaraGrupo     ;
end;

end.

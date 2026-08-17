// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Augusto
// Pendencia   : 19160
// Data        : 16.06.2003
// Alteração   : Atualizar FLGATIVO
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 16.06.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
unit FCadFilial;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fPessoa, Db, ExtDlgs, Pessoa, Menus, MontaSelect, DBTables, Wwdatsrc,
  Wwquery, TB97, MAHlpBtn, Buttons, Grids, Wwdbigrd, Wwdbgrid, StdCtrls,
  checklst, DBCtrls,  TabControlDetalhe,
  wwdblook, Mask, wwdbedit, TB97Ctls, TB97Tlbr, IvDictio, IvMulti, IvEMulti,
  CMDBLookupCombo, Wwdbspin, CmEventosCadastro, ImgList, ComCtrls,
  wwdbdatetimepicker, CMDateTimePicker, ExtCtrls, TREdit;

type
  TfrmCadFilial = class(TfrmPessoa)
    qrySubTipoIDFILIALPESSOA: TFloatField;
    DBEdit1: TDBEdit;
    tbsGeral: TTabSheet;
    Panel3: TPanel;
    qrySubTipoNUMFILIAL: TStringField;
    qrySubTipoFLGATIVO: TStringField;
    qrySubTipoFLGTIPO: TStringField;
    qrySubTipoSIGLA: TStringField;
    lblNumFilial: TLabel;
    dbedNumFilial: TDBEdit;
    RgTipo: TDBRadioGroup;
    lblSigla: TLabel;
    dbeSigla: TwwDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    Procedure CmeCadastroConfirma(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadFilial: TfrmCadFilial;

implementation

uses UMensErro, FTelaAut, Usistema, UAdmPrev;

{$R *.DFM}

procedure TfrmCadFilial.CmeCadastroConfirma(Sender: TObject);
begin
   if Trim(edDBGrupo.Text) = ''
   then begin
      MsgDlg('Para o caso de Filiais, é obrigatório informar o seu Grupo. '+#13+
             'O Grupo para as Filiais do Sistema Previdenciário é a Patrocinadora à qual '+
             'a Filial pertence. Verifique.','Erro',mtError,[mbOk],0);
      Abort;
   end;
   
   inherited;
    
    Try
      If Not Sistema.GravaLogOperacoes(Self.Caption) Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;

end;

procedure TfrmCadFilial.FormShow(Sender: TObject);
begin
  inherited;
  MontaSelect.Filtro.Add('PESSOA.IDGRUPO IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')');
end;

end.

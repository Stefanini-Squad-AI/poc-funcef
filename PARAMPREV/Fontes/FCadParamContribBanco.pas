// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//  Autor      : Camille
//  Rotina     : Tela
//  Data       : 20.07.2004
//  Pendência  : 16635
//  Descrição  : Criação do campo CODALTBAIXANPAGO (  Tipo de Alterador para
//               Baixa de Documentos não Pagos )
//------------------------------------------------------------------------------
unit FCadParamContribBanco;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, DBCtrls, Mask, wwdbedit,
  wwdblook;

type
  TfrmCadParamContribBanco = class(TfrmCadastroCS)
    Label1: TLabel;
    dbedNome: TwwDBEdit;
    DBRadioGroup2: TDBRadioGroup;
    GroupBox10: TGroupBox;
    dbedMens1: TwwDBEdit;
    dbedMens2: TwwDBEdit;
    dbrgrpFLGAGRUPABOLETA: TDBRadioGroup;
    qryTipoAlterador: TwwQuery;
    GroupBox1: TGroupBox;
    dblkpcmbAlterador: TwwDBLookupCombo;
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadParamContribBanco: TfrmCadParamContribBanco;

implementation

uses USistema;

{$R *.DFM}

procedure TfrmCadParamContribBanco.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor
  then begin
     qry.Close;
     qry.ParamByName('IDPLANOPREV').AsInteger := StrToInt(MontaSelect.ValoresChave[0]);
     qry.Open;
  end;

end;

procedure TfrmCadParamContribBanco.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
    
    Try
      If Not Sistema.GravaLogOperacoes(Self.Caption) Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;

end;

procedure TfrmCadParamContribBanco.FormShow(Sender: TObject);
begin
  inherited;
  qryTipoAlterador.Close; 
  qryTipoAlterador.Open;  

  qry.Close;
  qry.ParamByName('IDPLANOPREV').AsInteger := -1;
  qry.Open;
end;

end.

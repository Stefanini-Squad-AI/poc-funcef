unit fconsultafiario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroPai, CmEventosCadastro, ImgList, Db, Wwdatsrc, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97,
  ExtCtrls, MontaSelect, Grids, Wwdbigrd, Wwdbgrid, DBTables, Wwquery,
  DBCtrls, Mask;

type
  TFrmconsultafiario = class(TfrmCadastroPai)
    dbgfiario: TwwDBGrid;
    Montarubs: TMontaSelect;
    dsfiario: TwwDataSource;
    qryfiario: TwwQuery;
    edparticipante: TEdit;
    Label1: TLabel;
    qryfiarioNUMERORUBS: TFloatField;
    qryfiarioDATAINCLUSAO: TDateTimeField;
    qryfiarioNOMEUSUARIO: TStringField;
    DBMemoDescricaoAsuunto: TDBMemo;
    LBassunto: TLabel;
    ToolbarButton971: TToolbarButton97;
    MontaSelect: TMontaSelect;
    qryFiarioGrupo: TQuery;
    DBEGRUPO: TDBEdit;
    Label2: TLabel;
    qryfiarioNOME: TStringField;
    qryfiarioIDGRUPO: TFloatField;
    qryFiarioGrupoIDFIARASS: TFloatField;
    qryFiarioGrupoDESCRICAO: TStringField;
    qryfiarioDESCRICAO: TMemoField;
    procedure sbtnParticipanteClick(Sender: TObject);
    procedure sbtnrubsClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frmconsultafiario: TFrmconsultafiario;

implementation

uses FPrincipal;

{$R *.DFM}

// andre Tavares 07/08/2002
procedure TFrmconsultafiario.sbtnParticipanteClick(Sender: TObject);
begin
 inherited;
 MontaSelect.executar;
 If MontaSelect.RetornouValor Then
 begin
    edparticipante.text := MontaSelect.ValoresChave[3];
    if MontaSelect.ValoresChave[1] = MontaSelect.ValoresChave[2] then // Titular
      tag := 1
    else // dependente
      tag := 2;
    bbtnConfirmarClick(Sender);
 end;
end;



procedure TFrmconsultafiario.sbtnrubsClick(Sender: TObject);
begin
 // inherited;
  montarubs.executar;
 If Montarubs.RetornouValor Then
 begin
      edparticipante.text := Montarubs.ValoresChave[2];
      tag := 3;
      bbtnConfirmarClick(Sender);   // andre Tavares 21/01/2002
 end;
end;

procedure TFrmconsultafiario.bbtnConfirmarClick(Sender: TObject);
VAR
  ID,IDRUBS : INTEGER;
begin
  inherited;
  IF SELF.TAG = 1 THEN
    BEGIN
      ID := strToInt(MontaSelect.ValoresChave[1]);
    END;
  IF SELF.TAG = 2 THEN
    BEGIN
      ID := strToInt(MontaSelect.ValoresChave[2]);
    END;
  IF SELF.TAG = 3 THEN
    BEGIN
    ID :=  STRTOINT(Montarubs.ValoresChave[3]);
    IDRUBS := STRTOINT(Montarubs.ValoresChave[0]);
    END;
 with qryfiario   do
 begin
    If Active Then Close;
     sql.clear;
     sql.add(' SELECT FIA.DESCRICAO, NVL(FIA.IDRUBS,0) AS NUMERORUBS , FIA.IDGRUPO, PE.NOME, '+
    '                 FIA.DATAINCLUSAO, usu.nomeusuario  '+
    '         FROM PESSOA    PE, FIARIO FIA , usuariosistema usu    '+
    '         WHERE (FIA.IDPESSOA   = '+INTTOSTR(ID)+')   AND '+
    '               (USU.IDUSUARIO   =  FIA.IDUSUARIO)    AND '+
    '               (PE.IDPESSOA    =  FIA.IDPESSOA) ' );
    IF SELF.TAG = 3 THEN
      BEGIN
      sql.add(
    ' AND      (FIA.IDRUBS  = '+INTTOSTR(IDRUBS)+')   '   );

      END;

     sql.add(

    'ORDER BY FIA.DATAINCLUSAO');
    Open;
    qryFiarioGrupo.Open;
 end;
end;

end.

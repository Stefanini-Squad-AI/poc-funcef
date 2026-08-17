{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Eugênio C. Frioli               }
{ Criado Em: 15/08/2007                                 }
{                                                       }
{*******************************************************}

//******************************************************************************************
//N. Sol..........: 137269_7601
//N. Kintana......: 829602
//Data............: 27/12/2011
//Responsável.....: Paulo Nobre
//Descrição.......: Tipos de Despesa
//******************************************************************************************

Unit uCtrlDstTipoDespesa;

Interface

Uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
   uCtrlCustomRH, uDbDstTipoDespesa;

Type
   TCtrlDstTipoDespesa = Class(TCtrlCustomRH)
   Protected
      Procedure DoChangeDataBase; Override;
      Procedure OnCreateAppServer; Override;
   Private
      FDb: TDbDstTipoDespesa;
      FCds: TCMClientDataSet;
   Public
      Constructor Create; Override;
      Destructor Destroy; Override;

      Function ListDstTipoDespesa(IdDstTipoDespesa: double = 0): OleVariant;
      function DstDespesaDiaria: OleVariant;

      Function Gravar: boolean;

      Property Cds: TCMClientDataSet Read FCds Write FCds;
   End;

Implementation

Uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlFormFGTS }

Constructor TCtrlDstTipoDespesa.Create;
Begin
   Inherited;
   FDb := TDbDstTipoDespesa.Create(Self);
End;

Destructor TCtrlDstTipoDespesa.Destroy;
Begin
   FDb.Free;
   If (IsAppServer) Then
      FCds.Free;
   Inherited;
End;

Procedure TCtrlDstTipoDespesa.OnCreateAppServer;
Begin
   Inherited;
   FCds := TCMClientDataSet.Create(Nil);
End;

Procedure TCtrlDstTipoDespesa.DoChangeDataBase;
Begin
   Inherited;
   FDb.DataBaseName := DataBaseName;
End;

Function TCtrlDstTipoDespesa.ListDstTipoDespesa(IdDstTipoDespesa: double): OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + IFF(IdDstTipoDespesa = -1, ' /*+ OPTIMIZER_MODE RULE */', '') + CR_LF +
      '  IDDSTTIPODESPESA, DESCRICAO, FLGATIVA, TIPOQUALIFICACAO, SEQAPRESRESUMO' + CR_LF +
      'FROM' + CR_LF +
      '  DSTTIPODESPESA' + CR_LF +
      IFF(IdDstTipoDespesa = -1, 'WHERE (1 = 2)',
      IFF(IdDstTipoDespesa = 0, 'ORDER BY' + CR_LF + '  DESCRICAO', 'WHERE' + CR_LF +
      '  (IDDSTTIPODESPESA = ' + FloatToStr(IdDstTipoDespesa) + ')')));
End;

Function TCtrlDstTipoDespesa.Gravar: boolean;
Begin
   If (ConnectionSide = cnsClient) Then
      Begin
         Result := Connection.AppServer.Gravar(FCds.Data);
         If Not (Result) Then
            MessageInfo := Connection.AppServer.MessageInfo;
      End
   Else
      Begin
         Try
            StartTransaction;
            Result := ApplyCds(FCds, FDb, [], []);
            If (Result) Then
               Commit
            Else
               Raise Exception.Create(FDb.MessageInfo);
         Except
            On E: Exception Do
               Begin
                  Rollback;
                  Result := false;
                  MessageInfo := E.Message;
               End;
         End;
      End;
End;

function TCtrlDstTipoDespesa.DstDespesaDiaria: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IDDSTTIPODESPESA, DESCRICAO'+CR_LF+
    'FROM'+CR_LF+
    '  DSTTIPODESPESA'+CR_LF+
    'WHERE'+CR_LF+
        '  (NVL(FLGDIARIA,0) = 1)');
end;

End.

